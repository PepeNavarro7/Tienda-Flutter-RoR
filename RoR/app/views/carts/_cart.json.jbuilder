json.extract! cart, :id, :fecha, :tienda_id, :cliente_id, :recogida, :created_at, :updated_at
json.url cart_url(cart, format: :json)
