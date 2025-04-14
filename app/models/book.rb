class Book < ApplicationRecord
  has_many :reservations
  validates_presence_of :title

  enum :status, [ :available, :reserved ]
end
