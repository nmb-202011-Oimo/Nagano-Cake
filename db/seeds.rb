# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
   email: 'test@test.com',
<<<<<<< HEAD
   password: 'testte'
)

=======
   password: 'testtest',
)
>>>>>>> ea162616aee99125fccc63c409614533d0ab2e1f
Customer.create!(
   family_name: "田中",
   first_name: "英一",
   kana_family_name: "タナカ",
   kana_first_name: "ヒデカズ",
   email: "nagano@cake.com",
   password: "123456",
   zipcode: "0000000",
   address: "大阪府箕面市小野原東",
   phone_number: "12345678901",
   )
<<<<<<< HEAD

=======
>>>>>>> ea162616aee99125fccc63c409614533d0ab2e1f
Category.create!(
   name: "ケーキ",
   is_active: true,
   )
<<<<<<< HEAD

=======
>>>>>>> ea162616aee99125fccc63c409614533d0ab2e1f
Category.create!(
   name: "チョコレート",
   is_active: true,
   )
<<<<<<< HEAD

=======
>>>>>>> ea162616aee99125fccc63c409614533d0ab2e1f
Category.create!(
   name: "クッキー",
   is_active: true,
   )
<<<<<<< HEAD

=======
>>>>>>> ea162616aee99125fccc63c409614533d0ab2e1f
Item.create!(
   category_id: 1,
   name: "ショートケーキ",
   price: 400,
   introduction: "いちごの入ったケーキです",
   image_id: nil,
   is_active: true,)
<<<<<<< HEAD

=======
>>>>>>> ea162616aee99125fccc63c409614533d0ab2e1f
Item.create!(
   category_id: 1,
   name: "チョコケーキ",
   price: 400,
   introduction: "チョコの入ったケーキです",
   image_id: nil,
   is_active: true,)
<<<<<<< HEAD
   
=======
>>>>>>> ea162616aee99125fccc63c409614533d0ab2e1f
Item.create!(
   category_id: 1,
   name: "モンブランケーキ",
   price: 400,
   introduction: "栗の入ったケーキです",
   image_id: nil,
   is_active: true,)