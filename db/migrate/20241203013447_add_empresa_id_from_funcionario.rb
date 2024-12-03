class AddEmpresaIdFromFuncionario < ActiveRecord::Migration[7.1]
  def change
    add_reference :funcionarios, :empresa, foreign_key: true
  end
end
