class Review < ApplicationRecord
  belongs_to :goal
  belongs_to :book
  has_one :reader, through: :goal
end
