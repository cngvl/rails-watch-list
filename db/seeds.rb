# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

puts "Cleaning database"
Bookmark.destroy_all
List.destroy_all
Movie.destroy_all
puts "Creating flats"

10.times do
  p movie_name = Faker::Movie.unique.title
  Movie.create!(
    title: movie_name,
    overview: Faker::Movie.unique.quote,
    poster_url: "https://unsplash.com/s/photos/#{movie_name}",
    rating: rand(1..10)
  )
end

5.times do
  List.create!(
    name: Faker::Book.unique.genre
  )
end

Movie.all.each do |movie|
  Bookmark.create!(
    movie_id: movie.id,
    list_id: List.all.sample.id,
    comment: Faker::Quote.unique.famous_last_words
  )
end

puts "Finished!"
