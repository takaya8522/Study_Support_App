User.create!(name: "admins", email: "adminadmino@piyopiyo.com", password: "123456", password_confirmation: "123456", admin: true, provider: nil, uid: nil)
User.create!(name: "normal", email: "normalnormal@piyopiyo.com", password: "123456", password_confirmation: "123456", admin: false, provider: nil, uid: nil)

Category.create!(name: "英語", user_id: User.first.id)
Category.create!(name: "プログラミング", user_id: User.first.id)

50.times do
  StudyRecord.create!(title: "英文法の勉強",content: "英文法の本を読む",study_cycle: "一週間",comprehension: "まだ理解していません", user_id: User.first.id)
end

50.times do
  StudyRecord.create!(title: "Rubyの勉強",content: "コードを覚える",study_cycle: "一週間",comprehension: "まだ理解していません", user_id: User.second.id)
end