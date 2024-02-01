FactoryBot.define do
    factory :user do
      username { 'testuser' }
      email { 'testuser@example.com' }
      password { '12345' }
    end
  end
  