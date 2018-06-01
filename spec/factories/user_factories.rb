# Factory for User model
##  Added opening_status attribute to factory @ 01/06/2018 

FactoryBot.define do
  factory :user do
    company {Faker::Company.name}
    cnpj {Faker::Number.number(10)}
    cpf {Faker::Number.number(10)}
    telephone {Faker::Number.number(8)}
    email {Faker::Internet.email}
    password {Passgen::generate}
    invoices []
    earnings_type 1
    earnings_range 1
    opening_status "open"
    # is_active true
  end

  factory :invalid_user do
    email ''
  end
end
