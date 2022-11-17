class Offer < ApplicationRecord
  STATUSES = %i[pending completed rejected]

  belongs_to :product
  belongs_to :user

  has_one :seller, through: :product, class_name: 'User'

  scope :is, ->(status) { where(status:) }
end
