class RemoveAssetsFromGenes < ActiveRecord::Migration[5.1]
  def change
    remove_column :genes, :acceptors
    remove_column :genes, :donors
    remove_column :genes, :isoforms
  end
end
