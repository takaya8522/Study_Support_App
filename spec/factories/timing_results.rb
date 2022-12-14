FactoryBot.define do
  factory :first_timing_result, class: TimingResult do
    created_at { Time.now }
    updated_at { Time.now }
    study_record_id { 1 }
  end
end
