# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :skill do
    name "MyString"
    skillable_id 1
    skillable_type "MyString"
  end
end
