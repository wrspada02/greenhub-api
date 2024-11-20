class DropEmpresaCompras < ActiveRecord::Migration[7.1]
  def change
    drop_table :empresa_compras
  end
end
