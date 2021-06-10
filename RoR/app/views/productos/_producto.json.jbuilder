json.extract! producto, :id, :nombre, :stock, :precio, :descripcion, :created_at, :updated_at
json.url producto_url(producto, format: :json)
