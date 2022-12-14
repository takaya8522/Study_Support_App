FactoryBot.define do
  factory :first_timing_result, class: TimingResult do
    created_at { Time.now }
    deadline_on { Time.now }
    study_record_id { 1 }
  end
end
