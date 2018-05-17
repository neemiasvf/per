class CreateAnalyses < ActiveRecord::Migration[5.1]
  def change
    create_table :analyses do |t|
      t.references :gene, foreign_key: true
      t.integer :number_splices, default: 1
      t.integer :intron_min_length, default: 3  # codon size
      t.integer :intron_max_length
      t.integer :exon_min_length, default: 3  # codon size
      t.integer :exon_max_length
      t.float :acceptor_cutoff, default: 2.2
      t.float :donor_cutoff, default: 4.5
      t.boolean :display_stop, default: true
      t.boolean :display_cu, default: true
      t.integer :cu_size, default: 20
      t.integer :max_isoforms, default: 10
      t.integer :donors, array: true
      t.integer :acceptors, array: true
      t.text :isoforms, array: true
      t.datetime :queued_at
      t.datetime :started_at
      t.datetime :finished_at
      t.datetime :canceled_at
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
