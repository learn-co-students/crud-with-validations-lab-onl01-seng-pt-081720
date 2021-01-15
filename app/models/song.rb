class Song < ApplicationRecord

    validates :title, :artist_name, presence: true
    validates :title, uniqueness: { scope: [:artist_name, :release_year], message: 'already exists with that artist and release year.' }
    validates :release_year, presence: true, numericality: { less_than_or_equal_to: ->(_song) {Date.current.year } }, if: :released?

  def released?
    released == true
  end


end
