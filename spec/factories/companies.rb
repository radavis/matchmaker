# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :company do
    name "MyString"
    email "lindsay@awesome.com"
    city "MyString"
    state "MyString"
    description "MyText is da bomb"
    telecommute false
    industry
    size "MyString"
    year_founded 1
  end
end
