FactoryBot.define do
  factory :first_category, class: Category do
    name { '英語' }
    created_at { Time.now }
    updated_at { Time.now }
    user_id { 1 }
  end
end