class Funcionario < ApplicationRecord
  belongs_to :empresa
  belongs_to :pessoa
end
