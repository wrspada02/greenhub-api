class AddEndrecoOnEstoque < ActiveRecord::Migration[7.1]
  def change
    add_column :estoques, :endereco, :string
  end
end
