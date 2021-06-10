class CreateTiendas < ActiveRecord::Migration[6.1]
  def change
    create_table :tiendas do |t|
      t.string :ubicacion

      t.timestamps
    end
    add_index :tiendas, :ubicacion, unique: true
  end
end
