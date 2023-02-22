# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Movie.destroy_all
List.destroy_all


5.times do
  p movie_name = Faker::Movie.unique.title
  Movie.create!(
    title: movie_name,
    overview: Faker::Movie.quote,
    poster_url: "https://unsplash.com/s/photos/movie/#{movie_name}",
    rating: rand(1..10)
  )
  List.create!(
    name: Faker::Lorem.sentence(word_count: 3)
  )
end
