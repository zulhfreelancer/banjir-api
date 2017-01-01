class AddIndexToReports < ActiveRecord::Migration[5.0]
  def change
    add_index :reports, [:daerah, :negeri]
  end
end
