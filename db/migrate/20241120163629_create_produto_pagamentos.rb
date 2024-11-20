class CreateProdutoPagamentos < ActiveRecord::Migration[7.1]
  def change
    create_table :produto_pagamentos do |t|
      t.integer :quantidade

      t.timestamps
    end
  end
end
