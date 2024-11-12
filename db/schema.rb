# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_11_08_225208) do
  create_table "empresa_compras", force: :cascade do |t|
    t.integer "preco"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "empresa_vendas", force: :cascade do |t|
    t.float "preco"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "empresas", force: :cascade do |t|
    t.integer "id_empresa"
    t.string "endereco"
    t.string "cnpj"
    t.string "telefone"
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fornecedor_vendas", force: :cascade do |t|
    t.float "preco"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "fornecedor_id"
    t.integer "produto_id"
  end

  create_table "fornecedors", force: :cascade do |t|
    t.integer "id_fornecedor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "funcionarios", force: :cascade do |t|
    t.integer "id_funcionario"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "empresa_id"
    t.integer "pessoa_id"
  end

  create_table "pagamentos", force: :cascade do |t|
    t.float "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "empresa_id"
  end

  create_table "pessoas", force: :cascade do |t|
    t.integer "id_pessoa"
    t.string "nome"
    t.string "cpf"
    t.string "endereco"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "funcionario_id"
    t.integer "fornecedor_id"
  end

  create_table "produtos", force: :cascade do |t|
    t.integer "id_produto"
    t.string "tipo"
    t.float "peso"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
