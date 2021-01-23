class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: { scope: :artist_name && :release_year, message: "This song already exists" }
    validates :release_year, presence: true,
                           if: :released?
  validate :year_released
  def year_released
    if release_year.present? && release_year > DateTime.now.year
      errors.add(:release_year, "Year can't be higher than the present year")
    end
  end
end
