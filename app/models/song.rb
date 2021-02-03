class Song < ApplicationRecord
    validates :title, presence: true
    validates :artist_name, presence: true
    validates :release_year, presence: true, if: :released? #valid w/out release year when release is false
    validate :future_date
    validate :repeat_song_title

    def future_date
        if release_year.present? && release_year > Date.today.year
            errors.add(:release_year, "release year can't be in the future")
        end
    end

    def repeat_song_title
        if Song.any? {|s| s.title == title && s.release_year == release_year && s.artist_name == artist_name}
            errors.add(:title, "can't add the same song twice")
        end
    end
end
