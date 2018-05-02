class CreateGenes < ActiveRecord::Migration[5.1]
  def change
    create_table :genes do |t|
      t.string :name
      t.text :original_sequence
      t.text :sequence
      t.integer :donors, array: true
      t.integer :acceptors, array: true
      t.text :isoforms, array: true
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
