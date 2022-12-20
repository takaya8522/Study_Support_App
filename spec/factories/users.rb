FactoryBot.define do
  factory :user do
    name { 'test' }
    email { 'test@test.com' }
    password { '123456' }
    password_confirmation { '123456' }
    admin { 'false' }
    created_at { Time.now }
    updated_at { Time.now }

    factory :admin_user do
      name { 'admins' }
      email { 'adminadmino@piyopiyo.com' }
      admin { 'true' }
    end

    factory :normal_user do
      name { 'normal' }
      email { 'normalnormal@piyopiyo.com' }
    end
  end
end