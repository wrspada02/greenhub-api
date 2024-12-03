require 'rails_helper'

RSpec.describe "Empresas", type: :request do
  describe 'GET /empresas' do
    let!(:companies) { create_list(:empresa, 5) }

    it 'lists all products', :aggregate_failures do
      get "/empresas"

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(companies.size)
    end
  end

  describe 'GET /empresas/:id' do
    let!(:company) { create(:empresa) }

    it 'shows details of a specific product', :aggregate_failures do
      get "/empresas/#{company.id}"

      body = JSON.parse(response.body)

      expect(response).to have_http_status(:ok)
      expect(body["nome"]).to eq(company.nome)
      expect(body["cnpj"]).to eq(company.cnpj)
      expect(body["endereco"]).to eq(company.endereco)
    end
  end

  describe 'POST /empresas' do
    let(:headers) { { "accept" => "application/json" } }

    context 'with valid data' do
      let(:company) { { empresa: attributes_for(:empresa) } }

      it 'creates a company', :aggregate_failures do
        post "/empresas", params: company, headers: headers

        expect(response).to have_http_status(:created)
        expect(Empresa.count).to eq(1)
      end
    end

    context 'with invalid data' do
      it 'returns error when cnpj is nil' do
        invalid_params = build_invalid_empresa_params(cnpj: nil)

        post "/empresas", params: invalid_params, headers: headers

        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns error when endereco is nil' do
        invalid_params = build_invalid_empresa_params(endereco: nil)

        post "/empresas", params: invalid_params, headers: headers

        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns error when nome is less than 10 length string' do
        invalid_params = build_invalid_empresa_params(nome: 'dsadsa')

        post "/empresas", params: invalid_params, headers: headers

        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns error when nome is more than 40 length string' do
        invalid_params = build_invalid_empresa_params(nome: 'dsadsakjdfuidshfiueshfuiweshufdsufrsdhufrhewuirhewhyruewruweyuhriew')

        post "/empresas", params: invalid_params, headers: headers

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PUT /empresas/:id' do
    let(:company) { create(:empresa) }

    context 'with valid data' do
      let(:valid_params) { { empresa: { nome: "Beto da Silva" } } }

      it 'updates the company and returns the updated company', :aggregate_failures do
        put "/empresas/#{company.id}", params: valid_params

        body = JSON.parse(response.body)

        expect(response).to have_http_status(:ok)
        expect(body["nome"]).to eq("Beto da Silva")
      end
    end

    context 'with invalid data' do
      let(:invalid_params) { { empresa: { nome: "dsadsa" } } }

      it 'returns errors and does not update the company', :aggregate_failures do
        put "/empresas/#{company.id}", params: invalid_params

        body = JSON.parse(response.body)

        expect(response).to have_http_status(:unprocessable_entity)
        expect(body).to include("nome")
      end
    end
  end

  describe 'DELETE /empresas/:id' do
    let!(:company) { create(:funcionario) }

    it 'deletes the company and returns no content', :aggregate_failures do
      expect {
        delete "/empresas/#{company.id}"
      }.to change(Empresa, :count).by(-1)
      expect(response).to have_http_status(:no_content)
    end
  end
end
