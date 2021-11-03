# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Author.destroy_all
Book.destroy_all
Genre.destroy_all

jkr = Author.create(first_name: "JK", last_name: "Rowling")
clarke = Author.create(first_name: "Arthur", last_name: "Clarke")
foo = Author.create(first_name: "Test", last_name: "Author")
bar = Author.create(first_name: "Another", last_name: "Person")

genres = [
    Genre.create!(name: "Fantasy"),
    Genre.create!(name: "Sport"),
    Genre.create!(name: "Romance"),
    Genre.create!(name: "Sci-Fi"),
    Genre.create!(name: "Political"),
    Genre.create!(name: "Other"),
]

Book.create!(title: "Harry Potter", author: jkr, publisher: "Penguin", date_published: "2021-10-26", genres: [genres[0]], status: "in_stock")
Book.create!(title: "Fantastic Beasts", author: jkr, publisher: "Apple", date_published: "2021-10-26", genres: [genres[0]], status: "in_stock")
Book.create!(title: "2001", author: clarke, publisher: "foo", date_published: "2021-10-26", genres: [genres[3]], status: "in_stock")
Book.create!(title: "A Fall Of Moondust", author: clarke, publisher: "blah", date_published: "2021-10-26",  genres: [genres[3]], status: "in_stock")