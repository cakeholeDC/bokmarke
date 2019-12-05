class Review < ApplicationRecord
  belongs_to :goal
  belongs_to :book
  has_one :reader, through: :goal
  validates :content, length: {minimum: 3, maximum: 500}
  validates :rating, numericality: {only_integer: true, greater_than: 0, less_than: 6}
  validates :recommend, inclusion: { in: [true, false] }


end
