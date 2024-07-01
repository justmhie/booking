class CreateRoomTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :room_types do |t|
      t.references :hotel, null: false, foreign_key: true
      t.string :type
      t.text :description
      t.integer :capacity
      t.decimal :price_per_night

      t.timestamps
    end
  end
end
