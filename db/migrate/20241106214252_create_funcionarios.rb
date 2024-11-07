class CreateFuncionarios < ActiveRecord::Migration[7.1]
  def change
    create_table :funcionarios do |t|
      t.integer :id_funcionario

      t.timestamps
    end
  end
end
