# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user_one = User.create(name: 'John Doe', email: 'doejohn@email.com', password: 'password',
                       password_confirmation: 'password')
user_two = User.create(name: 'Jane Doe', email: 'doejane@email.com', password: 'password',
                       password_confirmation: 'password')
Transaction.create(from_wallet: user_one.wallet, to_wallet: user_two.wallet, amount: 50.0, transfer_type: 'deposit')
