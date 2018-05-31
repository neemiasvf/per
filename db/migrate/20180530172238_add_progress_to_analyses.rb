class AddProgressToAnalyses < ActiveRecord::Migration[5.2]
  def change
    add_column :analyses, :progress, :integer, default: 0
  end
end
