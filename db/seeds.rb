# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
2.times do |i|
  User.create(name: "name #{i +1}", password: 'pass', email: "email#{i +1}@email.com")
end

5.times do |i|
  Skill.create(title: "Skill #{i + 1}", language: 'Ruby', user: User.find(1))
end

5.times do |i|
  Skill.create(title: "Skill #{i + 1}", language: 'Ruby', user: User.find(2))
end
