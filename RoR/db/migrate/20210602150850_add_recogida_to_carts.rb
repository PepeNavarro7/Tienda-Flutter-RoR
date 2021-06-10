class AddRecogidaToCarts < ActiveRecord::Migration[6.1]
  def change
    add_column :carts, :recogida, :integer
  end
end
