class CreateClientes < ActiveRecord::Migration[6.1]
  def change
    create_table :clientes do |t|
      t.string :nombre
      t.string :apellidos
      t.string :email
      t.string :pass

      t.timestamps
    end
    add_index :clientes, :email, unique: true
  end
end
