class AddIdEmpresaOnFuncionario < ActiveRecord::Migration[7.1]
  def change
    add_reference :funcionarios, :empresas, foreign_key: true
  end
end
