class Reader < ApplicationRecord
	has_many :goals
	has_many :books, through: :goals

	validates :username, :name, presence: true
	validates :username, uniqueness: true

	validates :age, numericality: { greater_than: 13, less_than_or_equal_to: 100,  only_integer: true }
	# validates :age, presence: true
end
