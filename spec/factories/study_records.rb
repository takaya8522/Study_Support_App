FactoryBot.define do
  factory :study_record do
    title { 'テスト' }
    content { 'テスト' }
    created_at { Time.now }
    updated_at { Time.now }
    category_id { 1 }
    user_id { 1 }
  end

  factory :first_study_record, class: StudyRecord do
    title { '単語の勉強' }
    content { '単語帳を読む' }
    created_at { Time.now }
    updated_at { Time.now }
    category_id { 1 }
    user_id { 1 }
  end

  factory :second_study_record, class: StudyRecord do
    title { '英文法の勉強' }
    content { '英文法の本を読む' }
    created_at { Time.now }
    updated_at { Time.now }
    category_id { 1 }
    user_id { 1 }
  end

  factory :third_study_record, class: StudyRecord do
    title { 'リスニングの勉強' }
    content { '英語のニュースを聞く' }
    created_at { Time.now }
    updated_at { Time.now }
    category_id { 1 }
    user_id { 1 }
  end

  factory :fourth_study_record, class: StudyRecord do
    title { 'プログラミングの勉強' }
    content { 'qiitaを見る' }
    created_at { Time.now }
    updated_at { Time.now }
    category_id { 2 }
    user_id { 1 }
  end
end