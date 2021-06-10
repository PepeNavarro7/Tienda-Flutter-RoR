class CreateCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|
      t.date :fecha
      t.belongs_to :tienda, null: false, foreign_key: true
      t.belongs_to :cliente, null: false, foreign_key: true
      t.integer :recogida

      t.timestamps
    end
  end
end
