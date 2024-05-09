class Book < ApplicationRecord
  
  has_one_attached :image
  belongs_to :user
  
  validates :book_title, presence: true
  validates :book_review, presence: true
  
end
