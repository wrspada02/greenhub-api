class CreateEmpresaVendas < ActiveRecord::Migration[7.1]
  def change
    create_table :empresa_vendas do |t|
      t.float :preco

      t.timestamps
    end
  end
end
