class CreateProductos < ActiveRecord::Migration[6.1]
  def change
    create_table :productos do |t|
      t.string :nombre
      t.integer :stock
      t.decimal :precio, :precision =>5, :scale => 2 
      t.string :descripcion

      t.timestamps
    end
    add_index :productos, :nombre, unique: true
  end
end
