FactoryGirl.define do
  factory :news, :class => 'News' do
    title_pt "MyString"
    title_es "MyString"
    text_pt "MyString"
    text_es "MyString"
    user
  end

  factory :invalid_news, parent: :news do
    title_pt nil
    title_es nil
    text_pt nil
    text_es nil
    user_id nil
  end

end
