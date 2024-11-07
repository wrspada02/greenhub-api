FactoryBot.define do
  factory :empresa_compra do
    preco { Faker::Number.between(from: 100, to: 10_000) }

    created_at { Faker::Time.backward(days: 14) }
    updated_at { Faker::Time.backward(days: 7) }
  end
end
