class EmpresasController < ApplicationController
  before_action :set_empresa, only: %i[show update destroy]

  # GET /empresas
  def index
    @empresas = Empresa.all
    render json: @empresas
  end

  # GET /empresas/:id
  def show
    render json: @empresa
  end

  # POST /empresas
  def create
    @empresa = Empresa.new(empresa_params)
    if @empresa.save
      render json: @empresa, status: :created, location: @empresa
    else
      render json: @empresa.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /empresas/:id
  def update
    if @empresa.update(empresa_params)
      render json: @empresa
    else
      render json: @empresa.errors, status: :unprocessable_entity
    end
  end

  # DELETE /empresas/:id
  def destroy
    @empresa.destroy
    head :no_content
  end

  private

  # Set empresa for show, update, and destroy actions
  def set_empresa
    @empresa = Empresa.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through
  def empresa_params
    params.require(:empresa).permit(:empresa_id, :endereco, :cnpj, :telefone, :nome)
  end
end
