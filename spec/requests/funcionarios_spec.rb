require 'rails_helper'

RSpec.describe "Funcionarios", type: :request do
  describe 'GET /funcionarios' do
    let!(:employees) { create_list(:funcionario, 5) }

    it 'lists all employees', :aggregate_failures do
      get "/funcionarios"

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(employees.size)
    end
  end

  describe 'GET /funcionarios/:id' do
    let(:employee) { create(:funcionario) }

    it 'shows details of a specific employee', :aggregate_failures do
      get "/funcionarios/#{employee.id}"

      body = JSON.parse(response.body)
      expect(response).to have_http_status(:ok)
      expect(body["nome"]).to eq(employee.nome)
      expect(body["cpf"]).to eq(employee.cpf)
      expect(body["endereco"]).to eq(employee.endereco)
    end
  end

  describe 'POST /funcionarios' do
    let(:headers) { { "accept" => "application/json" } }

    context 'with valid data' do
      let!(:employee) { create(:empresa) }
      let(:valid_params) { { funcionario: attributes_for(:funcionario).merge(empresa_id: employee.id) } }

      it 'creates a employee', :aggregate_failures do
        post "/funcionarios", params: valid_params, headers: headers

        expect(response).to have_http_status(:created)
        expect(Funcionario.count).to eq(1)
      end
    end

    context 'with invalid data' do
      let!(:employee) { create(:empresa) }
      
      it 'returns error when cpf is nil' do
        invalid_params = build_invalid_funcionario_params(cpf: nil)

        post "/funcionarios", params: invalid_params, headers: headers

        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns error when endereco is nil' do
        invalid_params = build_invalid_funcionario_params(endereco: nil)

        post "/funcionarios", params: invalid_params, headers: headers

        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns error when nome is less than 10 length string' do
        invalid_params = build_invalid_funcionario_params(nome: 'dsadsa')

        post "/funcionarios", params: invalid_params, headers: headers

        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns error when nome is more than 40 length string' do
        invalid_params = build_invalid_funcionario_params(nome: 'dsadsakjdfuidshfiueshfuiweshufdsufrsdhufrhewuirhewhyruewruweyuhriew')

        post "/funcionarios", params: invalid_params, headers: headers

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PUT /funcionarios/:id' do
    let(:employee) { create(:funcionario) }

    context 'with valid data' do
      let(:valid_params) { { funcionario: { nome: "Beto da Silva" } } }

      it 'updates the employee and returns the updated employee', :aggregate_failures do
        put "/funcionarios/#{employee.id}", params: valid_params

        body = JSON.parse(response.body)

        expect(response).to have_http_status(:ok)
        expect(body["nome"]).to eq("Beto da Silva")
      end
    end

    context 'with invalid data' do
      let(:invalid_params) { { funcionario: { nome: "dsadsa" } } }

      it 'returns errors and does not update the employee', :aggregate_failures do
        put "/funcionarios/#{employee.id}", params: invalid_params

        body = JSON.parse(response.body)

        expect(response).to have_http_status(:unprocessable_entity)
        expect(body).to include("nome")
      end
    end
  end

  describe 'DELETE /funcionarios/:id' do
    let!(:employee) { create(:funcionario) }

    it 'deletes the employee and returns no content', :aggregate_failures do
      expect {
        delete "/funcionarios/#{employee.id}"
      }.to change(Funcionario, :count).by(-1)
      expect(response).to have_http_status(:no_content)
    end
  end
end
