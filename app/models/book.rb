class Book < ApplicationRecord
  belongs_to :author
  has_many :goals
  has_many :readers, through: :goals
  has_many :reviews

  def self.create_books_from_google(results)
  	@googlebooks = []
  	results.each do |book|
	  	authors = book.authors != '' ? book.authors : "Anonymous"
  		new_book = Book.find_or_create_by(
	  		title: book.title,
	  		author: Author.find_or_create_by(name: authors),
	  		description: book.description,
	  		category: book.categories,
	  		page_count: book.page_count,
	  		img: book.image_link
  		)
  		# fix later
  		new_book.author.bio = Faker::Lorem.paragraphs(number: 7).join
  		new_book.author.save

  		@googlebooks << new_book
  	end
  	@googlebooks
  end

end
