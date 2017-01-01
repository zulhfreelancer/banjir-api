class AddLatitudeAndLongitudeToReports < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :latitude,  :string
    add_column :reports, :longitude, :string
  end
end
