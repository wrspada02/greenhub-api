class Funcionario < ApplicationRecord
  has_one :pessoa
  belongs_to :empresa
end
