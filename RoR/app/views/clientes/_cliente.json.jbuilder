json.extract! cliente, :id, :nombre, :apellidos, :email, :pass, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)
