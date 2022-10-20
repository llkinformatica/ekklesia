json.extract! empresa, :id, :nome, :cnpj, :telefone, :email, :subdomain, :usuario_id, :created_at, :updated_at
json.url empresa_url(empresa, format: :json)
