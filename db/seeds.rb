# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create(email: 'gustavocaso@gmail.com')

#MOVIES
movie1 = Movie.create(title:Faker::Name.name, plot: Faker::Lorem.sentence, price: 2.99, created_at: Faker::Time.forward(rand(1..10)).to_datetime)
movie2 = Movie.create(title:Faker::Name.name, plot: Faker::Lorem.sentence, price: 2.99, created_at: Faker::Time.forward(rand(1..10)).to_datetime)
movie3 = Movie.create(title:Faker::Name.name, plot: Faker::Lorem.sentence, price: 2.99, created_at: Faker::Time.forward(rand(1..10)).to_datetime)
movie4 = Movie.create(title:Faker::Name.name, plot: Faker::Lorem.sentence, price: 2.99, created_at: Faker::Time.forward(rand(1..10)).to_datetime)
movie5 = Movie.create(title:Faker::Name.name, plot: Faker::Lorem.sentence, price: 2.99, created_at: Faker::Time.forward(rand(1..10)).to_datetime)
movie6 = Movie.create(title:Faker::Name.name, plot: Faker::Lorem.sentence, price: 2.99, created_at: Faker::Time.forward(rand(1..10)).to_datetime)
movie7 = Movie.create(title:Faker::Name.name, plot: Faker::Lorem.sentence, price: 2.99, created_at: Faker::Time.forward(rand(1..10)).to_datetime)
movie8 = Movie.create(title:Faker::Name.name, plot: Faker::Lorem.sentence, price: 2.99, created_at: Faker::Time.forward(rand(1..10)).to_datetime)

#SEASONS
season1 = Season.create(title:Faker::Name.name, plot: Faker::Lorem.sentence, price: 2.99, created_at: Faker::Time.forward(rand(1..10)).to_datetime)
season2 = Season.create(title:Faker::Name.name, plot: Faker::Lorem.sentence, price: 2.99, created_at: Faker::Time.forward(rand(1..10)).to_datetime)
season3 = Season.create(title:Faker::Name.name, plot: Faker::Lorem.sentence, price: 2.99, created_at: Faker::Time.forward(rand(1..10)).to_datetime)

#EPISODES
10.times do |x|
  season1.episodes << Episode.create(title:Faker::Name.name, plot: Faker::Lorem.sentence, number: x+1)
  season2.episodes << Episode.create(title:Faker::Name.name, plot: Faker::Lorem.sentence, number: x+1)
  season3.episodes << Episode.create(title:Faker::Name.name, plot: Faker::Lorem.sentence, number: x+1)
end

Library.create(user: User.first)
Library.first.movies << Movie.all
Library.first.user_movies.all.each do |user_movie|
  user_movie.update_attribute(:purchased_at, Faker::Time.forward(rand(1..11)).to_datetime)
  user_movie.update_attribute(:expire_at, user_movie.purchased_at + 2.days)
end

Library.first.seasons << Season.all
Library.first.user_seasons.all.each do |user_season|
  user_season.update_attribute(:purchased_at, Faker::Time.forward(rand(1..11)).to_datetime)
  user_season.update_attribute(:expire_at, user_season.purchased_at + 2.days)
end
