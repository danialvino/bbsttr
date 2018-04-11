# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "create Users"
User.create!({
  email: "pai@teste.com",
  password: "huehue",
  phone: 8199830,
  birthday: Date.today,
  name: "Painho",
  gender: "Masculino",
  address: "Rua ali a direita"
  })
User.create!({
  email: "sitter@teste.com",
  password: "huehue",
  phone: 8199832,
  birthday: Date.today,
  name: "Mainha",
  gender: "Feminino",
  address: "Rua ali a esquerda"
  })
puts "ok!"
puts "Create Sitter"
Sitter.create!({
  pay_rate: 69,
  about: "Oi meu nome é Baba! esse é meu :about",
  skills: ["Cozinhar"],
  user_id: 2
  })
  BankInfo.create!({
    agency: 02461,
    account: 40362,
    bank: "Banco do Brasil",
    sitter_id: 1,
    cpf: "050.290.934-00".to_i
    })
puts "ok!"
puts "Creating a child (hehe)"
Child.create!({
  gender: "Masculino",
  age: 5,
  user_id: 1,
  })
puts "ok!"
