class AddEmpresaIdToFuncionarios < ActiveRecord::Migration[7.1]
  def change
    add_column :funcionarios, :empresa_id, :integer
  end
end
