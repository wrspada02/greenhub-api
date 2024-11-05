class CreateEmpresas < ActiveRecord::Migration[7.1]
  def change
    create_table :empresas do |t|
      t.integer :id_empresa
      t.string :endereco
      t.string :cnpj
      t.string :telefone
      t.string :nome

      t.timestamps
    end
  end
end
