class Reader < ApplicationRecord
	has_many :goals
	has_many :books, through: :goals
end
