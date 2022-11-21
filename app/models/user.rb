class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :products
  has_many :offers
  def avatar_thumbnail
    # return default version unless avatar.attached?

    avatar.variant(resize: "300x300!").processed
  end

  # def avatar_key
    # avatar.attached? ? avatar.key : ""
  # end
end
