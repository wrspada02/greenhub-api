class ProdutosController < ApplicationController
  def index
    @products = Produto.all
  end

  def show
    @product = Produto.find(params[:id])
  end

  def create
    Rails.logger.debug "Params: #{params.inspect}"
    @product = Produto.new(product_params)
  end

  def destroy
    @product = Produto.find(params[:id])
    @product.destroy
  end

  private

  def product_params
    params.require(:produto).permit(:name, :price, :description, :stock)
  end
end
