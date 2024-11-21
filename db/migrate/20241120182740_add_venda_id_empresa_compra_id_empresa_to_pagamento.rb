class AddVendaIdEmpresaCompraIdEmpresaToPagamento < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :pagamentos, :empresas, column: :venda_id_empresa
    add_foreign_key :pagamentos, :empresas, column: :compra_id_empresa
  end
end
