class FuncionariosController < ApplicationController
    before_action :set_funcionario, only: %i[show update destroy]
  
    # GET /funcionarios
    def index
      @funcionarios = Funcionario.all
      render json: @funcionarios
    end
  
    # GET /funcionarios/:id
    def show
      render json: @funcionario
    end
  
    # POST /funcionarios
    def create
      @funcionario = Funcionario.new(funcionario_params)
      if @funcionario.save
        render json: @funcionario, status: :created, location: @funcionario
      else
        render json: @funcionario.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /funcionarios/:id
    def update
      if @funcionario.update(funcionario_params)
        render json: @funcionario
      else
        render json: @funcionario.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /funcionarios/:id
    def destroy
      @funcionario.destroy
      head :no_content
    end
  
    private
  
    # Set funcionario for show, update, and destroy actions
    def set_funcionario
      @funcionario = Funcionario.find(params[:id])
    end
  
    # Only allow a trusted parameter "white list" through
    def funcionario_params
      params.require(:funcionario).permit(:id_funcionario, :empresa_id, :nome, :cpf, :endereco)
    end
  end
  