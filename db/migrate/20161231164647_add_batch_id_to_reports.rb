class AddBatchIdToReports < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :batch_id, :integer, :default => 0
  end
end
