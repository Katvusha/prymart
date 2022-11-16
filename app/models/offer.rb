class Offer < ApplicationRecord
  belongs_to :product
  belongs_to :user

  has_one :seller, through: :product, class_name: 'User'
end
