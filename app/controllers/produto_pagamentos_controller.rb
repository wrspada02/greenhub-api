class ProdutoPagamentosController < ApplicationController
    before_action :set_produto_pagamento, only: %i[show update destroy]
  
    # GET /produto_pagamentos
    def index
      @produto_pagamentos = ProdutoPagamento.all
      render json: @produto_pagamentos
    end
  
    # GET /produto_pagamentos/:id
    def show
      render json: @produto_pagamento
    end
  
    # POST /produto_pagamentos
    def create
      @produto_pagamento = ProdutoPagamento.new(produto_pagamento_params)
      if @produto_pagamento.save
        render json: @produto_pagamento, status: :created, location: @produto_pagamento
      else
        render json: @produto_pagamento.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /produto_pagamentos/:id
    def update
      if @produto_pagamento.update(produto_pagamento_params)
        render json: @produto_pagamento
      else
        render json: @produto_pagamento.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /produto_pagamentos/:id
    def destroy
      @produto_pagamento.destroy
      head :no_content
    end
  
    private
  
    # Set produto_pagamento for show, update, and destroy actions
    def set_produto_pagamento
      @produto_pagamento = ProdutoPagamento.find(params[:id])
    end
  
    # Only allow a trusted parameter "white list" through
    def produto_pagamento_params
      params.require(:produto_pagamento).permit(:quantidade, :pagamento_id, :produto_id)
    end
  end  