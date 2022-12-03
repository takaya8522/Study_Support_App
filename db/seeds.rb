User.create!(name: "admins", email: "adminadmino@piyopiyo.com", password: "123456", password_confirmation: "123456", admin: true, provider: nil, uid: nil)
User.create!(name: "normal", email: "normalnormal@piyopiyo.com", password: "123456", password_confirmation: "123456", admin: false, provider: nil, uid: nil)

50.times do
  StudyRecord.create!(title: "英語の勉強",content: "単語を覚える",study_cycle: "一週間",comprehension: "まだ理解していません", user_id: User.first.id)
end

50.times do
  StudyRecord.create!(title: "プログラミングの勉強",content: "コードを覚える",study_cycle: "一週間",comprehension: "まだ理解していません", user_id: User.second.id)
end