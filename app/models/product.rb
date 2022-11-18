class Product < ApplicationRecord
  include PgSearch::Model

  belongs_to :user
  has_many :offers
  has_one_attached :photo

  validates :name, presence: true
  validates :price, presence: true

  pg_search_scope :search_by_name_and_category,
    against: [ :name, :category ],
    using: {
      tsearch: { prefix: true }
    }

  def card_image
    { 'Apple iTunes': "itunes.jpg",
      'Steam Wallet': "steam.jpg",
      'Blizzard': "battlenet.jpg" }[category.to_sym]
  end
end
