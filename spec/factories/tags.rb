FactoryGirl.define do
  factory :tag do
    sequence(:name) { |n| "Tag #{n}" }
    locale "pt-BR"
  end

end
