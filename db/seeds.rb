# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(username: "tom", password: "tomtom", password_confirmation: "tomtom", email: "tom@tom.com")
User.create(username: "tim", password: "timtim", password_confirmation: "timtim", email: "tim@tim.com", admin: true)


