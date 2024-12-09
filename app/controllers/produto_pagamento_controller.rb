class ProdutoPagamentoController < ApplicationController
    # PUT /produto_pagamentos/:produto_pagamento/pagamentos/:pagamentoId
    def update
      produto_id = params.require(:produtoId)
      pagamento_id = params.require(:pagamentoId)

      @produto_pagamento = ProdutoPagamento.find_by(pagamento_id: pagamento_id, produto_id: produto_id)
      quantity = params.require(:quantity)

      if quantity < 0
        render json: { error: 'Quantity must be greater than 0.' }, status: :unprocessable_entity
      end

      @produto_pagamento.update!(quantidade: quantity)
      render json: { message: 'Item added to payment successfully.' }, status: :ok
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: "Record not found: #{e.message}" }, status: :not_found
    rescue ActionController::ParameterMissing => e
      render json: { error: "Missing parameter: #{e.param}" }, status: :bad_request
    end
end
