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
			book.title
		end
	end

	def display_fav_author_by_id
		if self.fav_author
			author = Author.find(self.fav_author)
			author.name
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

	def sorted_goals
		self.goals.sort_by do |goal|
			goal.book.title
		end
	end

	def read
		self.goals.where("status = true")
	end


	def unread
		self.goals.where("status = false")
	end

	def number_pages_read
		self.read.sum do |goal|
			goal.book.page_count
		end
	end

	def number_pages_unread
		self.unread.sum do |goal|
			goal.book.page_count
		end
	end

	def number_reviews
		self.reviews.count
	end

	def average_review_length
		total = self.reviews.sum do |review|
			review.content.length
		end

		total / self.reviews.length
	end

	def average_rating
		total = self.reviews.sum do |review|
			review.rating
		end

		if self.reviews.length != 0
			total.to_f / self.reviews.length
		else
			"No"
		end
	end



end