require "test_helper"

class CartTest < ActiveSupport::TestCase
   test "No se crea cesta sin dueño" do
    cesta = Cart.new(tienda_id:1, cliente_id: 0)
    assert_not cesta.save, "No se guarda una cesta con cliente null"
   end

    
   #Test que no se puede proar al no dar id la base de datos
   test "Dos tiendas con mismos datos de parametros no son iguales" do
        cesta1 = Cart.new(tienda_id:1, cliente_id: 1)
        cesta1.save
        cesta2 = Cart.new(tienda_id:1, cliente_id: 1)
        cesta2.save
        assert_nil cesta1.id, "Saved the client without a email"
   end


    test "Actualizar articulo" do
        cesta1 = carts(:cesta1)
        #cesta= Cart.new(tienda_id:1, cliente_id: 1, recogida: 0)
        cesta1.cliente_id=5
        
        assert_not cesta1.save, "No se puede actualizar un cliente id mayor a los existentes"
   end



end
