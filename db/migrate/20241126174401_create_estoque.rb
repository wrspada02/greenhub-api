class CreateEstoque < ActiveRecord::Migration[7.1]
  def change
    create_table :estoques do |t|
      t.string :endereço
      t.references :empresa, null: false, foreign_key: true

      t.timestamps
    end
  end
end
