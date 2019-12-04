# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Goal.destroy_all
Reader.destroy_all
Book.destroy_all
Author.destroy_all

10.times do 
	book = Book.create(title: Faker::Book.title,
					description: Faker::Lorem.paragraph,
					page_count: rand(50...700),
					category: Faker::Book.genre,
					img: Faker::LoremFlickr.image(size: "50x60", search_terms: ['book-cover'])
					)
	author = Author.create(name: Faker::Book.author,
						bio: Faker::Lorem.paragraph,
						img: Faker::LoremFlickr.image(size: "50x60", search_terms: ['author'])
						)
	book.author = author
	book.save

	reader = Reader.create(name: Faker::Name.name,
							bio: Faker::Lorem.paragraph,
							age: rand(5..80),
							username: Faker::Internet.username,
							fav_book: book.id,
							fav_author: author.id)

	goal = Goal.create(reader_id: reader.id, book_id: book.id, status: true)
end