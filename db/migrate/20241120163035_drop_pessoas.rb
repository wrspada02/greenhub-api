class DropPessoas < ActiveRecord::Migration[7.1]
  def change
    drop_table :pessoas
  end
end
