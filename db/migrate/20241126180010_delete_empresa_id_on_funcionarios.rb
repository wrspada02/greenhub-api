class DeleteEmpresaIdOnFuncionarios < ActiveRecord::Migration[7.1]
  def change
    remove_column :funcionarios, :empresa_id, :integer
  end
end
