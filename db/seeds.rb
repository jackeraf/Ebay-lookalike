# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


category1 = Category.create(name: "computers")
category2 = Category.create(name: "mobile")
category3 = Category.create(name: "clothes")
category4 = Category.create(name: "accesories")

Product.create(category: category1, title: "McBook", description: "Best PC for developers", price: 500,image_url: "mc-book.jpg", user_id: 1, deadline: "12/11/2016")
Product.create(category: category3,title: "Winter jacket", description: "Keep it warm even in wintertime", price: 40,image_url: "winter-jacket.png", user_id: 1, deadline: "18/04/2016")
Product.create(category: category4,title: "Rayban sunglasses", description: "Cool sunglasses for summertime", price: 60,image_url: "rayban.jpg", user_id: 1, deadline: "09/12/2016")
Product.create(category: category3,title: "Casual Jacket", description: "Cool jacket", price: 20,image_url: "jacket.jpg", user_id: 1, deadline: "09/12/2016")
Product.create(category: category1,title: "HP computer", description: "Ultimate computer", price: 300,image_url: "hp.png", user_id: 1, deadline: "09/12/2016")
Product.create(category: category4,title: "Normal sunglasses", description: "Geeky glasses", price: 10,image_url: "sunglasses.png", user_id: 1, deadline: "09/12/2016")

User.create(id: 1, email: "a@gmail.com", username: "jarek", password: "123456")