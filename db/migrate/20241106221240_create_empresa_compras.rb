class CreateEmpresaCompras < ActiveRecord::Migration[7.1]
  def change
    create_table :empresa_compras do |t|
      t.integer :preco

      t.timestamps
    end
  end
end
