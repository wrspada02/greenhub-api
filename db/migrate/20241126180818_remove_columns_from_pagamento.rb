class RemoveColumnsFromPagamento < ActiveRecord::Migration[7.1]
  def change
    remove_column :pagamentos, :venda_id_empresa, :integer
    remove_column :pagamentos, :compra_id_empresa, :integer
  end
end
