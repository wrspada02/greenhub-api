class AddFuncionarioIdToPessoa < ActiveRecord::Migration[7.1]
  def change
    add_column :pessoas, :funcionario_id, :integer
  end
end
