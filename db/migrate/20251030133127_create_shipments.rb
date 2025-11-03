class CreateShipments < ActiveRecord::Migration[7.1]
  def change
    create_table :shipments do |t|
      t.string :zip,            null: false
      t.integer :prefecture_id, null: false
      t.string :city,           null: false
      t.string :address,        null: false
      t.string :building_name
      t.string :phone,          null: false
      t.references :order,      null: false, foreign_key: true
      t.timestamps
    end
  end
end
