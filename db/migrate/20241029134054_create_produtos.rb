class CreateProdutos < ActiveRecord::Migration[7.2]
  def change
    create_table :produtos do |t|
      t.integer :id_produto
      t.string :tipo
      t.decimal :peso

      t.timestamps
    end
  end
end
