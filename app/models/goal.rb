class Goal < ApplicationRecord
  belongs_to :reader
  belongs_to :book

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
