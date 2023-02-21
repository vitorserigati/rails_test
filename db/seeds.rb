# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user_one = User.create(first_name: 'John ', middle_name: 'B.', last_name: 'Doe', phone_number: '(11)9-025-8564',
                       cpf: '12345678910', email: 'doejohn@email.com', password: 'password',
                       password_confirmation: 'password')
user_two = User.create(first_name: 'Jane', middle_name: 'B.', last_name: 'Doe', phone_number: '(11)9-025-8564',
                       cpf: '12345678910', email: 'doejane@email.com', password: 'password',
                       password_confirmation: 'password')
