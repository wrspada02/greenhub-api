class AddEmpresaIdToPagamento < ActiveRecord::Migration[7.1]
  def change
    add_column :pagamentos, :empresa_id, :integer
  end
end
