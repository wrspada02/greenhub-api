class CreatePessoas < ActiveRecord::Migration[7.1]
  def change
    create_table :pessoas do |t|
      t.integer :id_pessoa
      t.string :nome
      t.string :cpf
      t.string :endereco

      t.timestamps
    end
  end
end
