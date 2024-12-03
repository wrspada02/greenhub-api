require 'rails_helper'

RSpec.describe "Produtos", type: :request do
  describe 'GET /produtos' do
    let!(:products) { create_list(:produto, 5) }

    it 'lists all products', :aggregate_failures do
      get "/produtos"

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(products.size)
    end
  end

  describe 'GET /produtos/:id' do
    let(:product) { create(:produto) }

    it 'shows details of a specific product', :aggregate_failures do
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
      let(:valid_params) { { produto: attributes_for(:produto) } }

      it 'creates a product', :aggregate_failures do
        post "/produtos", params: valid_params, headers: headers

        expect(response).to have_http_status(:created)
        expect(Produto.count).to eq(1)
      end
    end

    context 'with invalid data' do
      it 'returns error when peso is invalid' do
        invalid_params = { produto: attributes_for(:produto, peso: -1) }

        post "/produtos", params: invalid_params, headers: headers

        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns error when tipo is missing' do
        invalid_params = { produto: attributes_for(:produto, tipo: nil) }

        post "/produtos", params: invalid_params, headers: headers

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PUT /produtos/:id' do
    let(:product) { create(:produto) }

    context 'with valid data' do
      let(:valid_params) { { produto: { nome: "Mouse" } } }

      it 'updates the product and returns the updated product', :aggregate_failures do
        put "/produtos/#{product.id}", params: valid_params

        body = JSON.parse(response.body)

        expect(response).to have_http_status(:ok)
        expect(body["nome"]).to eq("Mouse")
      end
    end

    context 'with invalid data' do
      let(:invalid_params) { { produto: { peso: -5 } } }

      it 'returns errors and does not update the product', :aggregate_failures do
        put "/produtos/#{product.id}", params: invalid_params

        body = JSON.parse(response.body)

        expect(response).to have_http_status(:unprocessable_entity)
        expect(body).to include("peso")
      end
    end
  end

  describe 'DELETE /produtos/:id' do
    let!(:product) { create(:produto) }

    it 'deletes the product and returns no content', :aggregate_failures do
      expect {
        delete "/produtos/#{product.id}"
      }.to change(Produto, :count).by(-1)
      expect(response).to have_http_status(:no_content)
    end
  end
end
