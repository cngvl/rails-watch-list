# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
require 'open-uri'
require 'nokogiri'

html_file = URI.open('https://tmdb.lewagon.com/movie/top_rated').read
html_doc = JSON.parse(html_file)

puts 'Cleaning database'
Bookmark.destroy_all
List.destroy_all
Movie.destroy_all
puts 'Creating flats'

html_doc['results'].each do |element|
  Movie.create!(
    title: element['title'],
    overview: element['overview'],
    poster_url: "https://image.tmdb.org/t/p/w500/#{element['poster_path']}",
    rating: element['vote_average']
  )
end

5.times do
  list_name = Faker::Book.unique.genre
  list = List.new(
    name: list_name
  )
  list.photo.attach(io: URI.open("https://source.unsplash.com/1600x900/?#{Faker::Book.unique.genre}"), filename: "#{list_name}.png", content_type: 'image/png');
  # p list.photo.attached?
  list.save!
end

Movie.all.each do |movie|
  Bookmark.create!(
    movie_id: movie.id,
    list_id: List.all.sample.id,
    comment: Faker::Quote.unique.famous_last_words
  )
end

puts "Finished!"
