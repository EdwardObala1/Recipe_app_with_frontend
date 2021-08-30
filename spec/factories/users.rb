FactoryBot.define do
  factory :user do
    name { "Eddy1" }
    sequence(:email) { |n| "eddy#{n}@yahoo.com" }
    password { "password" }
  end
end
