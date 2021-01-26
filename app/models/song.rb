class Song < ApplicationRecord
    validates :title, presence:true, uniqueness: {scope: :artist_name}
    with_options if: :released? do |song|
        song.validates :release_year, presence:true
        song.validates :release_year, numericality:{less_than: Date.today.year}
    end

end
