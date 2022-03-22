# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
 email: 'test@test.com',
 password: 'testtest'
)

10.times do |n|
  User.create!(
    # n + 1で数字が重複しないようにする
    email: "test#{n + 1}@test.com",
    name: "テストユーザー#{n + 1}",
    password: "testhoge"
  )
end

Tag.create!(
 tag: '写真',
 )
 
 Tag.create!(
 tag: 'イラスト',
 )
 
 Tag.create!(
 tag: 'アイコン',
 )
 
 Tag.create!(
 tag: 'シルエット',
 )
 
 Tag.create!(
 tag: 'テクスチャ',
 )
 
 Tag.create!(
 tag: 'パターン',
 )