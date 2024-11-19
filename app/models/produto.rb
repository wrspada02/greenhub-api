class Produto < ApplicationRecord
  validates :peso, presence: true, numericality: { greater_than: 0 }
  validates :tipo, presence: true
  validates :nome, presence: :true
end
