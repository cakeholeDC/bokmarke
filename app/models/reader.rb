class Reader < ApplicationRecord
	has_many :goals
	has_many :books, through: :goals

	validates :username, :name, presence: true
	validates :username, uniqueness: true

	validates :age, numericality: { greater_than: 13, less_than_or_equal_to: 100,  only_integer: true }
	# validates :age, presence: true

	has_secure_password

	def self.search(search)
		if search
			username = Reader.where("username like ?", "%#{search}%")
			if username
				username
			else
				Reader.all
			end
		else
			Reader.all
		end
	end

	def display_fav_book_by_id
		if self.fav_book
			book = Book.find(self.fav_book)
			"Favorite Book: "  + book.title
		end
	end

	def display_fav_author_by_id
		if self.fav_author
			author = Author.find(self.fav_author)
			"Favorite Author: " + author.name
		end
	end

	def self.find_by_username(username)
		Reader.find_by(username: username)
	end


end