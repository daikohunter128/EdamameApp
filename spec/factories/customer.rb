FactoryGirl.define do
  factory :customer do
    sequence(:email) { |n| "member#{n}@example.com" }
    family_name '藤由'
    given_name '亮'
    family_name_kana 'フジヨシ'
    given_name_kana 'アキラ'
    password 'pw'
  end
end