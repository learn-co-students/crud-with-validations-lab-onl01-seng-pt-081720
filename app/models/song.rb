class Song < ApplicationRecord

    validates :title, presence: true
    validates :title, uniqueness: { scope: :artist_name && :release_year, message: "Has already been added with that artist and release year" }
    validates :release_year, presence: true,
                if: :released?
    validate :year_released

    def year_released
        if release_year.present? && release_year > DateTime.now.year
          errors.add(:release_year, "Can't add a year higher than present year")
        end
    end

end
