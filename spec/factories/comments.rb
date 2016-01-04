FactoryGirl.define do
  factory :comment do
    user
    association :commentable, factory: :news
    locale "pt-BR"
    moderated false
    message "MyComment"
  end

  factory :invalid_comment, parent: :comment do
    user nil
    association nil
    locale nil
    moderated nil
    message nil
  end

end
