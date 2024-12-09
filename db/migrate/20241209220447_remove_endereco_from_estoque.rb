class RemoveEnderecoFromEstoque < ActiveRecord::Migration[7.1]
  def change
    remove_column :estoques, :endereço, :string
  end
end
