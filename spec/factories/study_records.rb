FactoryBot.define do
  factory :study_record do
    title { 'テスト' }
    content { 'テスト' }
    created_at { Time.now }
    updated_at { Time.now }

    factory :first_study_record do
      title { '単語の勉強' }
      content { '単語帳を読む' }
    end

    factory :second_study_record do
      title { '英文法の勉強' }
      content { '英文法の本を読む' }
    end

    factory :third_study_record do
      title { 'リスニングの勉強' }
      content { '英語のニュースを聞く' }
    end

    factory :fourth_study_record do
      title { 'プログラミングの勉強' }
      content { 'qiitaを見る' }
    end
  end
end
