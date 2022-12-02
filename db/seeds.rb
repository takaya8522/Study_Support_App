# User.create!(name: "adminsさん", email: "adminadmino@piyopiyo.com", password: "123456", password_confirmation: "123456", admin: true)
# User.create!(name: "normalさん", email: "normalnormal@piyopiyo.com", password: "123456", password_confirmation: "123456", admin: false)

50.times do
  StudyRecord.create!(title: "英語の勉強",content: "単語を覚える",study_cycle: "一週間",comprehension: "まだ理解していません", user_id: User.first.id)
end

# 50.times do
#   Task.create!(title: "second_task", content: "テスト", deadline_on: "2025/02/17", priority: 2, status: 1, user_id: User.second.id)
# end