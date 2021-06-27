class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :movies, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :movie_comments, dependent: :destroy
  has_many :profiles, dependent: :destroy
  has_many :direct_messages, dependent: :destroy
  has_many :entries, dependent: :destroy

  has_many :followers, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy, inverse_of: :follower
  has_many :followings, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy, inverse_of: :followed

  has_many :following_users, through: :followings, source: :followed
  has_many :follower_users, through: :followers, source: :follower

  def follow(other_user)
    Relationship.create(follower_id: id, followed_id: other_user.id)
  end

  def unfollow(other_user)
    relationship = self.followings.find_by(followed_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.following_users.include?(other_user)
  end

  def self.looks(search, word)
    if search == "perfect_match"
      @user = User.where("username LIKE?", "#{word}")
    elsif search == "forward_match"
      @user = User.where("username LIKE?","#{word}%")
    elsif search == "backward_match"
      @user = User.where("username LIKE?","%#{word}")
    elsif search == "partial_match"
      @user = User.where("username LIKE?","%#{word}%")
    else
      @user = User.all
    end
  end

  attachment :profile_image
  validates :introduction,length: { maximum: 200}


end
