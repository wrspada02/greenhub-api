class DropFornecedors < ActiveRecord::Migration[7.1]
  def change
    drop_table :fornecedors
  end
end
