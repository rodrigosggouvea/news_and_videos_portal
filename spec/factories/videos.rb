FactoryGirl.define do
  factory :video do
    user
    title_pt "MyString"
    title_es "MyString"
    link "MyString"
  end

  factory :invalid_video, parent: :video do
    user_id nil
    title_pt nil
    title_es nil
    link nil
  end

end
