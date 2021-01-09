class Song < ActiveRecord::Base
    validates :title, presence: true
    validates :title, uniqueness: true
    validates :release_year, presence: false, if: :released == false
    validate :current_year
    validate :released?

    def current_year
        if release_year
            if self.release_year > Time.current.year
                errors.add(:release_year, "Release year is in the future")
            end
        end
    end

    def released?
        if released == true && !release_year
            errors.add(:released, "This song is released but missing a release year")
        end
    end
end