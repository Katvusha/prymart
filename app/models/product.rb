class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  validates :content, presence: true, uniqueness: true
end
