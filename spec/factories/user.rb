FactoryBot.define do
  factory :user, class: User do
    name { "test" }
    email { "example@email.com" }
    icon { 1 }
    password { "password" }

    after(:create) do |user|
      create(:user_result, user: user, result: create(:result))
    end
  end
end
