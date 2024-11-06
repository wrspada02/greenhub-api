FactoryBot.define do
  factory :fornecedor do
    sequence(:id_fornecedor) { |n| n }

    created_at { Faker::Time.backward(days: 14) }
    updated_at { Faker::Time.backward(days: 7) }
  end
end
