class Reader < ApplicationRecord
	has_many :goals
	has_many :books, through: :goals
	has_many :reviews, through: :goals

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

	# def self.session_user
	# 	Reader.find_by(username: session[:username]) #unless !session[:username]
	# end

	def goal_by_book(book)
		self.goals.find_by(book_id: book.id)
	end

	def can_review?(book)
		goal = self.goal_by_book(book)
		goal && goal.status && !goal.review
	
	end

	def can_add_to_reading_list?(book)
		!self.goal_by_book(book)
	end



end