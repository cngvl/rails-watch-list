class Movie < ApplicationRecord
  # validates :title, presence: true
  validates :title, :overview, uniqueness: true, presence: true
  # validates :name, :address, presence: true
  has_many :bookmarks
end


# A movie must have a unique title and an overview.
# A list must have a unique name.
# A bookmark must be linked to a movie and a list, and the [movie, list] pairings should be unique.
# The comment of a bookmark cannot be shorter than 6 characters.
