class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal         ,null: false
      t.string :city           ,null: false
      t.integer :prefecture_id ,null: false
      t.string :addresses      ,null: false
      t.string :phone_number   ,null: false
      t.string :building_name
      t.references :purchase   ,foreign_key: true
      t.timestamps
    end
  end
end
