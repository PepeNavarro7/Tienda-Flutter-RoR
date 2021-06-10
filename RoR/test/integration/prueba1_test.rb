require "test_helper"



 
class Prueba1Test < ActionDispatch::IntegrationTest


  test "Se visualiza la pantalla de inicio de sesion" do
    get "/"
    assert_select "h1", "DANI WEB ADMIN"
  end


  test "Iniciar sesion" do
    post '/login',
      params: {
           username: "MyString",
           password: "pepe"
         }
        assert_response :redirect
        get "/"
        assert_select "h4","Bienvenido a la aplicación de Dani para Trabajadores, MyString"
 

        get "/tiendas"
         assert_select "th", "Ubicación"

        
        get "/productos"
        assert_select "th", "Precio"

        post "/productos",
        params:{
          producto:{
            nombre: "Ejemplo1",
            stock: 2,
            precio: 3,
            descripcion: "ejemplo de prueba"
          }
        }
        assert_response :redirect
        follow_redirect!
        assert_select "p","Producto creado correctamente."
  end
 
end