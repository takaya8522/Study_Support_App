FactoryBot.define do
  factory :study_timing do
    first_timing { 1.day.from_now }
    second_timing { 2.days.from_now }
    third_timing { 6.days.from_now }
    fourth_timing { 1.month.from_now }
    created_at { Time.now }
    updated_at { Time.now }
  end
end
