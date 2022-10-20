json.extract! pessoa, :id, :nome, :sobrenome, :genero, :telefone, :email, :celular, :logradouro, :numero, :complemento, :bairro, :cidade, :estado, :cep, :data_nascimento, :data_falecimento, :data_batismo, :bio, :created_at, :updated_at
json.url pessoa_url(pessoa, format: :json)
