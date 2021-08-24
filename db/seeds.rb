# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Admin.create!(
                  email: "example@mail.com",
                  password: "123456",
                  )


Customer.create!(
                  user_status: "true",
                  l_name: "見本",
                  f_name: "名前",
                  l_kana: "サンプル",
                  f_kana: "ネーム",
                  address: "住所が入ります",
                  post_code: "1234567",
                  phone_number: "00000000000",
                  email: "example@mail.com",
                  password: "123456",
                  )