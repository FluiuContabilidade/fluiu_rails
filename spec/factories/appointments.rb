FactoryBot.define do
  factory :appointment do
    item_date "MyString"
    item_type
    item_description  Faker::Company.bs
  end
end
