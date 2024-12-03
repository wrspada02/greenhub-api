class AddEmpresaIdFromPagamento < ActiveRecord::Migration[7.1]
  def change
    add_reference :pagamentos, :empresa, foreign_key: true
  end
end
