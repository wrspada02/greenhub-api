class AddIndexCompraVendaOnPagamento < ActiveRecord::Migration[7.1]
  def change
    add_index :pagamentos, :venda_id_empresa
    add_index :pagamentos, :compra_id_empresa
  end
end
