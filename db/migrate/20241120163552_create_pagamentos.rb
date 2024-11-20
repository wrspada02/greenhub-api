class CreatePagamentos < ActiveRecord::Migration[7.1]
  def change
    create_table :pagamentos do |t|
      t.string :tipo
      
      t.timestamps
    end
  end
end
