require "test_helper"

class ClientesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cliente = clientes(:one)
  end

  test "Deberia encontrar la url de clientes" do
    get clientes_url
    assert_response :success
  end

  test "Deberia encontrar la url para crear nuevo cliente" do
    get new_cliente_url
    assert_response :success
  end


  test "Deberia obtener la url para editar cliente" do
    get edit_cliente_url(@cliente)
    assert_response :success
  end

  test "Deberia actualizar un cliente" do
    patch cliente_url(@cliente), params: { cliente: { apellidos: @cliente.apellidos, email: @cliente.email, nombre: @cliente.nombre, pass: @cliente.pass } }
    assert_redirected_to cliente_url(@cliente)
  end

  test "Deberia eliminar a un cliente" do
    assert_difference('Cliente.count', -1) do
      delete cliente_url(@cliente)
    end
  end

end
