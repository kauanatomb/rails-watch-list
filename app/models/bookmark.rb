class Bookmark < ApplicationRecord
    belongs_to :movie
    belongs_to :list
    validates :comment, :movie, :list, presence: true
    validates :list_id, uniqueness: { scope: :movie_id}
    validates :comment, length: { minimum: 6 }
end