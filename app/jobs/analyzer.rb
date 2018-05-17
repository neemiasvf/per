class Analyzer

  def initialize(analysis)
    @analysis = analysis
    @current_mutation = []
    @mutations = []
  end

  # Longest Common Substring Problem
  # Returns the longest common substring of two strings.
  # https://rosettacode.org/wiki/Longest_Common_Substring#Ruby
  def longest_common_substring_size(a, b)
    lengths = Array.new(a.length) { Array.new(b.length, 0) }
    greatestLength = 0
    output = ""
    a.each_char.with_index do |x, i|
      b.each_char.with_index do |y, j|
        next if x != y
        lengths[i][j] = (i.zero? || j.zero?) ? 1 : lengths[i-1][j-1] + 1
        if lengths[i][j] > greatestLength
          greatestLength = lengths[i][j]
          output = a[i - greatestLength + 1, greatestLength]
        end
      end
    end
    output.size
  end

  # Alternative Splice Site Predictor (ASSP)
  # 1. Sends a POST request to the ASSP website with the user's parameters, containing all gene data relevant to prediction;
  # 2. Gets an HTML response containing information about acceptors and donors and their position in the sequence;
  # 3. Process response and stores it in the database.
  # http://wangcomputing.com/assp/index_multiseq.html
  def pre_splice
    acceptors = []
    donors = []
    response = HTTP.post(ASSP_URI, form: {
        seqfield: ">#{@analysis.name}\n#{@analysis.sequence}",
        'AccCutOff': @analysis.acceptor_cutoff,
        'DonCutOff': @analysis.donor_cutoff,
        'DisplayStop': @analysis.display_stop,
        'DisplayCU': @analysis.display_cu,
        'CUWinSize': @analysis.cu_size
    })
    response = response.body.to_s
    response.each_line.with_index do |line, index|
      if index > 1  # skip the 2 first lines (sequence name and headers)
        columns = line.split("|")  # get splice site's columns as an array
        position = columns.first.to_i  # get the base pair of the splice site
        (columns[1].include? 'acceptor') ? acceptors.push(position) : donors.push(position)  # sort acceptors and donors
      end
    end
    @analysis.update_columns(acceptors: acceptors, donors: donors)
  end

  # Calculates all possible combinations between acceptors and donors.
  def splice(current_acceptor)

    # 1. Gets all donors found after the current acceptor
    next_donors = @analysis.donors.select { |donor| donor > current_acceptor }

    # 2. Loop through donors
    while next_donors.any?
      current_donor = next_donors.first

      # 3. Calculates exon length
      # EXCEPTION: EMPTY COMBINATION
      # Combination will be empty at first execution and every time it's back to root.
      # If that's the case, the exon length will be the actual current donor;
      # otherwise it'll be the length between the current donor and the last acceptor.
      @current_mutation.empty? ? exon_length = current_donor : exon_length = (@current_mutation.last..current_donor).size

      # 4. Checks if the exon length meets the user's requirements
      # REQUIREMENT: EXON LENGTH
      # At this point, an EXON is formed, but it will be added to the mutation ONLY IF its length meets the user's requirements.
      # If the exon length is NOT within the parameters, skip to the next loop.
      # If it is, add the current donor to the current mutation.
      unless exon_length.between? @analysis.exon_min_length, @analysis.exon_max_length
        next_donors.delete current_donor
        next
      end

      # 5. Adds the current donor to current mutation ONLY IF the user's requirements were met
      @current_mutation.push current_donor

      # 6. Gets all acceptors found after the current donor
      next_acceptors = @analysis.acceptors.select { |acceptor| acceptor > current_donor }

      # 7. Loop through acceptors
      while next_acceptors.any?
        current_acceptor = next_acceptors.first

        # 8. Calculates the intron length
        # Introns include only what's between the donor and the acceptor;
        # therefore, we need to subtract 2 basepairs from that given range, i.e., the actual donor and acceptor.
        intron_length = (@current_mutation.last..current_acceptor).size - 2

        # 9. Checks if the intron length meets the user's requirements
        # REQUIREMENT: INTRON LENGTH
        # At this point, an INTRON is formed, but it will be added to the mutation ONLY IF its length meets the user's requirements.
        # If the intron length is NOT within the parameters, skip to the next loop.
        # If it is, add the current acceptor to the current mutation.
        unless intron_length.between? @analysis.intron_min_length, @analysis.intron_max_length
          next_acceptors.delete current_acceptor
          next
        end

        # 10. Adds the current acceptor to current mutation ONLY IF the user's requirements were met
        @current_mutation.push current_acceptor

        # 11. Checks if the current mutation matches the number of splices
        # REQUIREMENT: VALID COMBINATION
        # Combination MUST match number of splices, i.e.,
        # the length of the current mutation divided by 2 must be equal to the number of splices provided by the user.
        # Only then the current mutation can be added to the list of valid combinations.
        # If the current mutation does not meet the number of splices yet, then find the next donor by starting all over again.
        if @current_mutation.size / 2 == @analysis.number_splices
          @mutations.push Array.new(@current_mutation)
        else
          splice(current_acceptor)
          # •-> returns to this point after looping through all donors for the current acceptor
        end

        # 12. Moves to the next acceptor
        # At this point, all possible donors were processed for the current acceptor.
        # Now it's time to move to the next acceptor by removing it from the current mutation and list of acceptors.
        # By removing the last acceptor from the current mutation, we also ensure that every donor connects only with an acceptor.
        @current_mutation.pop
        next_acceptors.delete current_acceptor
      end

      # 13. Moves to the next donor
      # At this point, all possible acceptors were processed for the current donor.
      # Now it's time to move to the next donor by removing it from the current mutation and list of donors.
      # By removing the last donor from the current mutation, we also ensure that every donor connects only with an acceptor.
      @current_mutation.pop
      next_donors.delete current_donor
    end
  end

  # Assembles isoforms strings based on valid combinations (mutations), refines the results and sorts them based on their similarity score.
  def post_splice
    isoforms = {}
    @mutations.each do |mutation|
      sequence_size = @analysis.sequence.size
      # When calculating the length of the sequence after the splicing,
      # we want to remove the nucleotides BETWEEN the donor and acceptor (introns).
      # To achieve that, we need to step one base pair after the donor and one base pair before the acceptor.
      (1..mutation.size).step(2).each { |index| sequence_size -= (mutation[index-1]+1...mutation[index]).size }

      # REQUIREMENT: VALID ISOFORM
      # The isoform size must be divisible by 3, i.e., the size of a codon.
      # If that's the case, then we look for the stop codon and cut the isoform there, resulting in its final version.
      # If not, proceed to the next mutation.
      if sequence_size % 3 == 0
        isoform_string = String.new(@analysis.sequence)
        # The same splicing derivatives applies here, but when dealing with the sequence itself,
        # we need to consider that the base pair count starts at 1, unlike Ruby's Array class.
        (1..mutation.size).step(2).each { |index| isoform_string.slice! mutation[index-1]...mutation[index]-1 }

        # REQUIREMENT: STOP CODON
        # The isoform must end with a stop codon.
        # A stop codon can be either "TGA", "TAG" or "TAA".
        # If any of the above is found, the isoform is cut there.
        # If none of the above is found, the isoform is not changed.
        if isoform_string.index(/TGA|TAG|TAA/)
          isoform_string = isoform_string[0..isoform_string.index(/TGA|TAG|TAA/) + 2]
        end

        # REQUIREMENT: SIMILARITY SCORE
        # In order to keep the results researchable, only the isoforms with the most similarity with the original sequence are kept.
        # Therefore, the Longest Common Substring Problem is the perfect implementation to sort out those isoforms.
        # Based on that, the following is done:
        # 1. Proceed only if the isoform is unique;
        # 2. Get the similarity score, which is the size of the longest common substring between the original sequence and the isoform;
        # 3. If the desired amount of isoforms was reached:
        #   3.1. Get the lowest similarity score from the isoforms list;
        #   3.2. If the current isoform's similarity score is greater than the lowest one, it'll take its place;
        #   3.3. If it's the same score, just add the "duplicate";
        # 4. If the desired amount of isoforms was not yet reached, just add it to the list.
        unless isoforms.include? isoform_string
          similarity_score = longest_common_substring_size(@analysis.sequence, isoform_string)
          if isoforms.count >= @analysis.max_isoforms
            lowest_similarity_score = isoforms.values.min
            if similarity_score > lowest_similarity_score
              isoforms.delete_if { |isoform_string, similarity_score| similarity_score == lowest_similarity_score }
              isoforms.store String.new(isoform_string), similarity_score
            elsif similarity_score == lowest_similarity_score
              isoforms.store String.new(isoform_string), similarity_score
            end
          else
            isoforms.store String.new(isoform_string), similarity_score
          end
        end
      end
    end
    isoforms = isoforms.sort_by { |isoform_string, similarity_score| similarity_score }.to_h.keys  # sort isoforms by similarity score
    @analysis.update_columns(isoforms: isoforms)
  end
end