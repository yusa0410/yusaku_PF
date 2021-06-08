class Movie < ApplicationRecord

  belongs_to :user
  has_many :movie_comment, dependent: destroy
  has_many :favorite, dependent: destroy

end
