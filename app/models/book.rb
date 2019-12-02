class Book < ApplicationRecord
  belongs_to :author
  has_many :goals
  has_many :readers, through: :goals
end
