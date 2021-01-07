class Song < ApplicationRecord

    validates :title, :artist_name, :genre, presence: true
    validates :title, uniqueness: { scope: :release_year, message: "should only be released once per year" }
    validates :released, inclusion: [true, false]
    validates :release_year, presence: true, if: :album_released?
    validates :release_year, numericality: { less_than_or_equal_to: Date.today.year, message: "must be valid year" }, if: :album_released?

    def album_released?
        released
    end
end


