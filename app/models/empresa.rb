class Empresa < ApplicationRecord
  validates :nome, presence: true, length: { minimum: 10, maximum: 40 }
  validates :cnpj, presence: true
end
