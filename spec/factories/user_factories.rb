FactoryBot.define do
  factory :user do
    company {Faker::Company.name}
    cnpj {Faker::Number.number(10)}
    cpf {Faker::Number.number(10)}
    telephone {Faker::Number.number(8)}
    email {Faker::Internet.email}
    password {Passgen::generate}
    invoices []
  end
end
