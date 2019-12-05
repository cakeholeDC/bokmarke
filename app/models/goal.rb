class Goal < ApplicationRecord
  belongs_to :reader
  belongs_to :book
  has_one :review

  validates :status, inclusion: { in: [true, false] }
  # validate :uniqueness_by_reader


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



  # def uniqueness_by_reader
  # 	Goal.find_by(reader_id: self.reader_id, book_id: self.book_id)
  # end
end
