class Book < ApplicationRecord
  
  belongs_to :user
  
  validates :book_title, presence: true
  validates :book_review, presence: true, length: { maximum: 200 }
  
end
