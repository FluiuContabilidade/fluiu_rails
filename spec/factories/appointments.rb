FactoryBot.define do
  factory :appointment do
    item_date "MyString"
    item_type Faker::Company.bs
    item_description "MyString"
  end
end
