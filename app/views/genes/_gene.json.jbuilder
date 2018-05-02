json.extract! gene, :id, :name, :original_sequence, :sequence, :donors, :acceptors, :isoforms, :user_id, :created_at, :updated_at
json.url gene_url(gene, format: :json)
