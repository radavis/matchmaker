# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :profile do
    first_name "MyString"
    last_name "MyString"
    city "MyString"
    state "MyString"
    linkedin "MyString"
    github "MyString"
    twitter "MyString"
    blog "MyString"
    stackoverflow "MyString"
    relocate false
  end
end
