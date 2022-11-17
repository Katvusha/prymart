class Product < ApplicationRecord
  belongs_to :user
  has_many :offers
  has_one_attached :photo

  validates :name, presence: true
  validates :price, presence: true
  validates :content, presence: true


  def card_image
    { 'Apple iTunes': "itunes.jpg",
      'Steam Wallet': "steam.jpg",
      'Blizzard': "battlenet.jpg" }[category.to_sym]
  end
end
