class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :movie, dependent: destroy
  has_many :favorite, dependent: destroy
  has_many :relationship, dependent: destroy
  has_many :movie_comment, dependent: destroy
  has_many :profile, dependent: destroy
  has_many :direct_message, dependent: destroy
  has_many :entry, dependent: destroy

end
