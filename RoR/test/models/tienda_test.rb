require "test_helper"

class TiendaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end



    test "Update ubicacion tienda" do
      tienda = Tienda.new(ubicacion:"")
      tienda.ubicacion="La Chana"
      assert_equal tienda.ubicacion,"La Chana", "Se modifica el texto de la ubicación de una tienda"
   end
end
