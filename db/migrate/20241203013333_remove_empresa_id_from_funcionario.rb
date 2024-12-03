class RemoveEmpresaIdFromFuncionario < ActiveRecord::Migration[7.1]
  def change
    remove_column :funcionarios, :empresas_id, :integer
  end
end
