FactoryBot.define do
  factory :pagamento do
    sequence(:id_pagamento) { |n| n }

    tipo { Faker::Finance.ticker }
    created_at { Faker::Time.backward(days: 14) }
    updated_at { Faker::Time.backward(days: 7) }
  end
end
