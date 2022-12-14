FactoryBot.define do
  factory :admin_user, class: User do
    name { 'admins' }
    email { 'adminadmino@piyopiyo.com' }
    password { '123456' }
    password_confirmation { '123456' }
    admin { 'true' }
    created_at { Time.now }
    deadline_on { Time.now }
  end

  factory :normal_user, class: User do
    name { 'normal' }
    email { 'normalnormal@piyopiyo.com' }
    password { '123456' }
    password_confirmation { '123456' }
    admin { 'false' }
    created_at { Time.now }
    deadline_on { Time.now }
  end
end