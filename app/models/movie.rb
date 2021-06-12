class Movie < ApplicationRecord

  belongs_to :user
  has_many :movie_comments, dependent: :destroy
  belongs_to :genre
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end


end
