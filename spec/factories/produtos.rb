FactoryBot.define do
  factory :produto do
    nome { Faker::Commerce.product_name }
    tipo { Faker::Commerce.product_name }
    peso { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
  end
end