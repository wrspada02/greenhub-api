FactoryBot.define do
  factory :produto do
    sequence(:id_produto) { |n| n }
    tipo { Faker::Commerce.product_name }
    peso { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
  end
end