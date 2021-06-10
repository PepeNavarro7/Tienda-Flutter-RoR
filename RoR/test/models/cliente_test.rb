require "test_helper"

class ClienteTest < ActiveSupport::TestCase

  
   test "No se crea cesta sin dueño" do
    cesta = Cart.new(tienda_id:1, cliente_id: 0)
    assert_not cesta.save, "No se guarda una cesta con cliente null"
   end

end
