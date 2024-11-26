class AddForeignKeyInPagamento < ActiveRecord::Migration[7.1]
  def change
    add_reference :pagamentos, :empresas, foreign_key: true
  end
end
