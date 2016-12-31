class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.decimal :paras_air
      t.string :jenis_jalan
      t.string :section
      t.string :no_laluan
      t.string :nama_laluan
      t.string :nama_jalan
      t.string :daerah
      t.string :negeri
      t.datetime :dikemaskini

      t.timestamps
    end
  end
end
