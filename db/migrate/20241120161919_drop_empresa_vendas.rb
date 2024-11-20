class DropEmpresaVendas < ActiveRecord::Migration[7.1]
  def change
    drop_table :empresa_vendas
  end
end
