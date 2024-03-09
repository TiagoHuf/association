require 'faker'
require 'cpf_cnpj'

Debt.destroy_all
Person.destroy_all
User.destroy_all

User.create(
  email: 'admin@admin.com',
  password: '1234567'
)

user_ids = []
50.times do
  user = User.create(
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
  user_ids << user.id
end

person_ids = []
100.times do
  person = Person.create(
    name: Faker::Name.name,
    phone_number: Faker::PhoneNumber.phone_number,
    national_id: CPF.generate,
    active: Faker::Boolean.boolean,
    user_id: user_ids.sample
  )
  person_ids << person.id
end

500.times do
  Debt.create(
    person_id: person_ids.sample,
    amount: Faker::Number.decimal(l_digits: 2),
    observation: Faker::Lorem.sentence
  )
end
