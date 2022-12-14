class Product < ApplicationRecord
  include PgSearch::Model

  belongs_to :user
  has_many :offers
  belongs_to :subcategory
  has_many :categories, through: :subcategory, source: :categories
  has_one_attached :photo

  validates :name, presence: true
  validates :price, presence: true

  pg_search_scope :search_by_subcategory,
                  against: %i[name],
                  associated_against: { subcategory: %i[name] },
                  using: { tsearch: { prefix: true } }

  def card_image
    { 'Apple iTunes' => "itunes.jpg",
      'Steam Wallet' => "steam.jpg",
      'Blizzard' => "battlenet.jpg" }[name]
  end

  def image_card
    { 'Apple iTunes' => "itunescard.jpg",
      'Steam Wallet' => "steamcard.jpg",
      'Blizzard' => "blizzardcard.jpg" }[subcategory.name]
  end
end
