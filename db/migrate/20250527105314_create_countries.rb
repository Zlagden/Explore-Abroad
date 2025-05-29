class CreateCountries < ActiveRecord::Migration[7.1]
  def change
    create_table :countries do |t|
      t.string :name
      t.json :information
      t.string :image_url
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
