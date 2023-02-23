class Movie < ApplicationRecord
  has_many :bookmarks
  validates :title, presence: true, allow_blank: false
  validates :title, uniqueness: true
  validates :overview, presence: true, uniqueness: true, allow_blank: false
end
