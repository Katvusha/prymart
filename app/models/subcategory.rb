class Subcategory < ApplicationRecord
  belongs_to :category
  has_many :products

  def card_image
    { 'Apple iTunes' => "itunes.jpg",
      'Steam Wallet' => "steam.jpg",
      'Blizzard' => "battlenet.jpg" }[name]
  end
end

# through: :category
