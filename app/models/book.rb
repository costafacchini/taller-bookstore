class Book < ApplicationRecord
  validates_presence_of :title

  enum :status, [ :available, :reserved ]
end
