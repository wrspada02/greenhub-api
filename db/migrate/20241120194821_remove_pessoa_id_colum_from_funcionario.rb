class RemovePessoaIdColumFromFuncionario < ActiveRecord::Migration[7.1]
  def change
    remove_column :funcionarios, :pessoa_id
  end
end
