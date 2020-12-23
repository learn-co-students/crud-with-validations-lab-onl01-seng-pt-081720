class Song < ApplicationRecord
  validates :title, presence: true
  validate :song_repeat
  validates :release_year, presence: true,
                           if: :released?
  validate :year_released

  def song_repeat
    if Song.find { |t| t.title == title && t.artist_name == artist_name && t.release_year == release_year }
      errors.add(:title, "this song has already been added")
    end
  end

  def year_released
    if release_year.present? && release_year > DateTime.now.year
      errors.add(:release_year, "can't add a year higher than present year")
    end
  end
end
