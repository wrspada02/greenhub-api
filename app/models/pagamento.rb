class Pagamento < ApplicationRecord
  validates :tipo, presence: true
end
