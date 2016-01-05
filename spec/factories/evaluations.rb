FactoryGirl.define do
  factory :evaluation do
    user
    association :gradable, factory: :news
    grade 1
  end

end
