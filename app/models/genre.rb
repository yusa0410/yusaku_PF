class Genre < ApplicationRecord
  has_many :genre, dependent: :destroy
end
