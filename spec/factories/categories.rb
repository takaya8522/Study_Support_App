FactoryBot.define do
  factory :first_category, class: Category do
    name { '英語' }
    created_at { Time.now }
    deadline_on { Time.now }
    user_id { 1 }
  end
end