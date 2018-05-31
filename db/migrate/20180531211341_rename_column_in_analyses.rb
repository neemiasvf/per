class RenameColumnInAnalyses < ActiveRecord::Migration[5.2]
  change_table :analyses do |t|
    t.rename :finished_at, :completed_at
  end
end
