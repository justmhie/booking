class CreateHotels < ActiveRecord::Migration[7.0]
  def change
    create_table :hotels do |t|
      t.string :hotel_name
      t.text :description
      t.string :location
      t.string :contact_details
      t.text :amenities
      t.text :photo_gallery

      t.timestamps
    end
  end
end
