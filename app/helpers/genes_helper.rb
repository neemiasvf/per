module GenesHelper
  def truncated_sequence(sequence)
    truncate(sequence, length: 50)
  end
end
