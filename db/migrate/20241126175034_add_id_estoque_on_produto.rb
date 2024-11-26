class AddIdEstoqueOnProduto < ActiveRecord::Migration[7.1]
  def change
    add_reference :produtos, :estoque, foreign_key: true
  end
end
