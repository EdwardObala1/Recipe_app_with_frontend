FactoryBot.define do
  factory :comment do
    user 
    recipe 
    comment { "This is my first comment" }
  end
end
