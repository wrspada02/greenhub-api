json.extract! produto, :id, :id_produto, :tipo, :peso, :created_at, :updated_at
json.url produto_url(produto, format: :json)
