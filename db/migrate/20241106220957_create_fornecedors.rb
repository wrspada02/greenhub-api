class CreateFornecedors < ActiveRecord::Migration[7.1]
  def change
    create_table :fornecedors do |t|
      t.integer :id_fornecedor

      t.timestamps
    end
  end
end
