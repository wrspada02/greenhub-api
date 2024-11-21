FactoryBot.define do
  factory :produto_pagamento do
    sequence(:id_produto_pagamento) { |n| n }

    quantidade { Faker::Number.number(2) }
    created_at { Faker::Time.backward(days: 14) }
    updated_at { Faker::Time.backward(days: 7) }
  end
end
