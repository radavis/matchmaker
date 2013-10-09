# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :company do
    name "MyString"
    email "MyString"
    city "MyString"
    state "MyString"
    description "MyText"
    telecommute false
    industry "MyString"
    size "MyString"
    year_founded 1
  end
end
