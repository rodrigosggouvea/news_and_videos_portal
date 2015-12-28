FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "User #{n}" }
    sequence(:email) { |n| "user#{n}@email.com" }
    password '12345678'
    password_confirmation '12345678'
    admin false
    banned false
  end

end
