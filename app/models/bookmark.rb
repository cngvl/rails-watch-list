class Bookmark < ApplicationRecord
  belongs_to :list
  belongs_to :movie

  validates :movie, uniqueness: { scope: :list }
  validates :comment, presence: true, length: { minimum: 6 }
end

# A movie must have a unique title and an overview.
# A list must have a unique name.
# A bookmark must be linked to a movie and a list, and the [movie, list] pairings should be unique.
# The comment of a bookmark cannot be shorter than 6 characters.
