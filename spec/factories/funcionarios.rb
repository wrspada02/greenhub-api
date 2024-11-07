FactoryBot.define do
  factory :funcionario do
    sequence(:id_funcionario) { |n| n }

    created_at { Faker::Time.backward(days: 14) }
    updated_at { Faker::Time.backward(days: 7) }
  end
end
