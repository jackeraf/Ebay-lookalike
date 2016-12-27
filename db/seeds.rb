# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Product.create(title: "McBook", description: "Best PC for developers", price: 500,image_url: "mc-book.jpg",deadline: "12/11/2016")
Product.create(title: "Winter jacket", description: "Keep it warm even in wintertime", price: 40,image_url: "winter-jacket.png",deadline: "18/04/2016")
Product.create(title: "Rayban sunglasses", description: "Cool sunglasses for summertime", price: 60,image_url: "rayban.jpg",deadline: "09/12/2016")
