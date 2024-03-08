# db/seeds.rb
require 'faker'
require 'cpf_cnpj'

# Crie um usuário de exemplo
User.create(
  email: 'admin@example.com',
  encrypted_password: 'password' # É altamente recomendável não usar senhas em texto plano em um ambiente de produção
)

# Crie mais alguns usuários aleatórios e armazene seus IDs
user_ids = []
50.times do
  user = User.create(
    email: Faker::Internet.email,
    encrypted_password: Faker::Internet.password
  )
  user_ids << user.id
end

100.times do
  Person.create(
    name: Faker::Name.name,
    phone_number: Faker::PhoneNumber.phone_number,
    national_id: CPF.generate,
    active: Faker::Boolean.boolean,
    user_id: user_ids.sample # Seleciona aleatoriamente um dos IDs armazenados
  )
end

500.times do
  Debt.create(
    person_id: Faker::Number.between(from: 1, to: 100), # Supondo que existem 100 pessoas na tabela people
    amount: Faker::Number.decimal(l_digits: 2),
    observation: Faker::Lorem.sentence
  )
end
