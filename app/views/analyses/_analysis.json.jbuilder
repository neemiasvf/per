json.extract! analysis, :id, :gene_id, :number_splices, :intron_min_length, :intron_max_length, :exon_min_length, :exon_max_length, :acceptor_cutoff, :donor_cutoff, :display_stop, :display_cu, :cu_size, :status, :queued_at, :started_at, :finished_at, :canceled_at, :created_at, :updated_at
json.url analysis_url(analysis, format: :json)
