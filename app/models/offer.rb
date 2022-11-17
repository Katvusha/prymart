class Offer < ApplicationRecord
  STATUSES = %i[pending completed rejected]

  belongs_to :product
  belongs_to :user

  scope :is, ->(status) { where(status:) }
end
