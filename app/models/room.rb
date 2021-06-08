class Room < ApplicationRecord

  has_many :direct_message, dependent: destroy
  has_many :entry, dependent: destroy

end
