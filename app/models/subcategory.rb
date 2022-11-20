class Subcategory < ApplicationRecord
  belongs_to :category
  has_many :products

  def card_image
    { 'Apple iTunes' => "itunes.jpg",
      'Steam Wallet' => "steam.jpg",
      'Blizzard' => "battlenet.jpg" }[name]
  end

  def image_card
    { 'Apple iTunes' => "itunescard.jpg",
      'Steam Wallet' => "steamcard.jpg",
      'Blizzard' => "blizzardcard.jpg" }[name]
  end
end

# through: :category
