class Product < ApplicationRecord
  belongs_to :user
  has_many :offers
  has_one_attached :photo

  validates :name, presence: true
  validates :price, presence: true
  validates :content, presence: true
end
