class AddGoogleMapsToReports < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :google_maps_url, :string
  end
end
