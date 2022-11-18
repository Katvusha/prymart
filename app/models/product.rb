class Product < ApplicationRecord
  belongs_to :user
  has_many :offers
  has_many :subcategories
  has_one_attached :photo

  validates :name, presence: true
  validates :price, presence: true

  def card_image
    { 'Apple iTunes' => "itunes.jpg",
      'Steam Wallet' => "steam.jpg",
      'Blizzard' => "battlenet.jpg" }[name]
  end
end
