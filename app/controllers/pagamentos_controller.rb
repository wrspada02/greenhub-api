class PagamentosController < ApplicationController
    before_action :set_pagamento, only: %i[show update destroy]
  
    # GET /pagamentos
    def index
      @pagamentos = Pagamento.all
      render json: @pagamentos
    end
  
    # GET /pagamentos/:id
    def show
      render json: @pagamento
    end
  
    # POST /pagamentos
    def create
      @pagamento = Pagamento.new(pagamento_params)
      if @pagamento.save
        render json: @pagamento, status: :created, location: @pagamento
      else
        render json: @pagamento.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /pagamentos/:id
    def update
      if @pagamento.update(pagamento_params)
        render json: @pagamento
      else
        render json: @pagamento.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /pagamentos/:id
    def destroy
      @pagamento.destroy
      head :no_content
    end
  
    private
  
    # Set pagamento for show, update, and destroy actions
    def set_pagamento
      @pagamento = Pagamento.find(params[:id])
    end
  
    # Only allow a trusted parameter "white list" through
    def pagamento_params
      params.require(:pagamento).permit(:tipo, :venda_id_empresa, :compra_id_empresa)
    end
  end
  