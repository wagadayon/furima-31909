class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postcode,    null: false
      t.integer :area_id, null: false
      t.string :municipality,   null: false
      t.string :address,        null: false
      t.string :room_name
      t.string :phone_number,   null: false
      t.references :purchase,   foreign_key: true
      t.timestamps
    end
  end
end
