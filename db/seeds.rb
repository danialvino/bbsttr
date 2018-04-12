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
  address: "Rua Harmonia 539, Sao Paulo"
  })
User.create!({
  email: "pai2@teste.com",
  password: "huehue",
  phone: 123456,
  birthday: Date.today,
  name: "Papai",
  gender: "Masculino",
  address: "Avenida Paulista 1234, Sao Paulo"
  })
User.create!({
  email: "pai3@teste.com",
  password: "huehue",
  phone: 9999999,
  birthday: Date.today,
  name: "Joao",
  gender: "Masculino",
  address: "Rua Siqueira Campos, 65 - Copacabana, Rio de Janeiro"
  })
User.create!({
  email: "sitter@teste.com",
  password: "huehue",
  phone: 8199832,
  birthday: Date.today,
  name: "Mainha",
  gender: "Feminino",
  address: "Rua Mourato Coelho 139, Sao Paulo"
  })
User.create!({
  email: "sitter2@teste.com",
  password: "huehue",
  phone: 010101,
  birthday: Date.today,
  name: "Luiza",
  gender: "Feminino",
  address: "R. Coriolano, 2100-2118, Vila Romana, Sao Paulo"
  })
User.create!({
  email: "sitter3@teste.com",
  password: "huehue",
  phone: 010101,
  birthday: Date.today,
  name: "Luiza",
  gender: "Feminino",
  address: "Av. Nossa Sra. de Copacabana, 493 - Copacabana, Rio de Janeiro "
  })

puts "ok!"
puts "Create Sitter"
Sitter.create!({
  pay_rate: 69,
  about: "Oi meu nome é Baba! esse é meu :about",
  skills: ["Cozinhar"],
  user_id: 4
  })
  BankInfo.create!({
    agency: 02461,
    account: 40362,
    bank: "Banco do Brasil",
    sitter_id: 1,
    cpf: "050.290.934-00".to_i
    })
Sitter.create!({
  pay_rate: 49,
  about: "Oi, esse é meu :about",
  skills: ["Brincar"],
  user_id: 5
  })
  BankInfo.create!({
    agency: 02461,
    account: 40362,
    bank: "Santander",
    sitter_id: 2,
    cpf: "050.290.924-00".to_i
    })
  Sitter.create!({
  pay_rate: 49,
  about: "Hellooooo",
  skills: ["Comer bolos"],
  user_id: 6
  })
  BankInfo.create!({
    agency: 02461,
    account: 40362,
    bank: "Itau",
    sitter_id: 3,
    cpf: "050.290.954-00".to_i
    })
puts "ok!"
puts "Creating some children (hehe)"
Child.create!({
  gender: "Masculino",
  age: 5,
  user_id: 1,
  })
Child.create!({
  gender: "Feminino",
  age: 10,
  user_id: 2,
  })
Child.create!({
  gender: "Masculino",
  age: 6,
  user_id: 3,
  })
puts "ok!"
