class Goal < ApplicationRecord
  belongs_to :reader
  belongs_to :book
  has_one :review

  def check_if_true
  	if self.status
  		"Finished book"
  	else
  		"In progess"
  	end
  end

  def author
  	self.book.author
  end
end
