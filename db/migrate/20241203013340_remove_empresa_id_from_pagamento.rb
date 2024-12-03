class RemoveEmpresaIdFromPagamento < ActiveRecord::Migration[7.1]
  def change
    remove_column :pagamentos, :empresas_id, :integer
  end
end
