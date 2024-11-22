require 'rails_helper'

RSpec.describe "Produtos", type: :request do
  let(:products) { [{ nome: "Monitor", tipo: "Vidro", peso: 2.3 }, { nome: "Mouse", tipo: "Plastico", peso: 1.1 }] }
  
  def create_product(params = {})
    default_params = { nome: "Teclado", tipo: "Plástico", peso: 1.2 }
    Produto.create!(default_params.merge(params))
  end

  describe 'GET /produtos' do
    before do
      products.each { |product| create_product(product) }
    end

    it 'lists all products' do
      get "/produtos"

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(products.size)
    end
  end

  describe 'GET /produtos/:id' do
    let!(:product) { create_product(products.first) }

    it 'shows details of a specific product' do
      get "/produtos/#{product.id}"

      body = JSON.parse(response.body)
      expect(response).to have_http_status(:ok)
      expect(body["nome"]).to eq(product.nome)
      expect(body["tipo"]).to eq(product.tipo)
      expect(body["peso"]).to eq(product.peso)
    end
  end

  describe 'POST /produtos' do
    let(:headers) { { "accept" => "application/json" } }

    context 'with valid data' do
      it 'creates a product' do
        params = { produto: { nome: "Mouse", tipo: "Madeira", peso: 3.4 } }

        post "/produtos", params: params, headers: headers

        expect(response.content_type).to eq("application/json; charset=utf-8")
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid data' do
      it 'returns error when peso is less than or equal to 0' do
        params = { produto: { nome: "Mouse", tipo: "Madeira", peso: 0 } }

        post "/produtos", params: params, headers: headers

        expect(response.content_type).to eq("application/json; charset=utf-8")
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns error when tipo is missing' do
        params = { produto: { nome: "Mouse", peso: 3.4 } }

        post "/produtos", params: params, headers: headers

        expect(response.content_type).to eq("application/json; charset=utf-8")
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PUT /produtos/:id' do
    let!(:product) { create_product }

    context 'with valid data' do
      it 'updates the product and returns the updated product' do
        params = { produto: { nome: "Mouse", tipo: "Madeira", peso: 3.4 } }

        put "/produtos/#{product.id}", params: params

        expect(response).to have_http_status(:ok)
        body = JSON.parse(response.body)
        expect(body["nome"]).to eq("Mouse")
        expect(body["tipo"]).to eq("Madeira")
        expect(body["peso"]).to eq(3.4)
      end
    end

    context 'with invalid data' do
      it 'returns errors and does not update the product' do
        params = { produto: { peso: -5 } }

        put "/produtos/#{product.id}", params: params

        expect(response).to have_http_status(:unprocessable_entity)
        body = JSON.parse(response.body)
        expect(body).to include("peso")
      end
    end
  end

  describe 'DELETE /produtos/:id' do
    let!(:product) { create_product }

    it 'deletes the product and returns no content' do
      expect {
        delete "/produtos/#{product.id}"
      }.to change(Produto, :count).by(-1)

      expect(response).to have_http_status(:no_content)
    end
  end
end
