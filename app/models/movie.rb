class Movie < ApplicationRecord

  belongs_to :user
  has_many :movie_comments, dependent: :destroy
  belongs_to :genre
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.looks(search, word)
    if search == "perfect_match"
      @movie = Movie.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @movie = Movie.where("title LIKE?","#{word}")
    elsif search == "backward_match"
      @movie = Movie.where("title LIKE?","#{word}")
    elsif search == "partial_match"
      @movie = Movie.where("title LIKE?","#{word}")
    else
      @movie = Movie.all
    end
  end

  validates :title, presence: true
  validates :review, presence: true,length: { maximum: 200}



end
