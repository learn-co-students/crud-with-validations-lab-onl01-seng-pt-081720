class Song < ActiveRecord::Base
    validates :title, presence: true
    validates :artist_name, presence: true
    validates :released, inclusion: { in: [true, false] }
    validates :title, uniqueness: {
        scope: [:title, :artist_name, :release_year],
        message: "Cannot release the same song twice."
    }
    validate :must_contain_release_year
    validate :release_year_cant_be_in_future

    private


    def must_contain_release_year

        # if released is true, and the release year is not included, then mark it as invalid

        # is release not nil?
        if !self.released.nil?

            # if released is true
            if self.released == true

                # if release year is nil or empty, then this is false
                if self.release_year.nil?
                    errors.add(:release_year, "Missing release year!")
                end
            end
        end
    end

    def release_year_cant_be_in_future

        # if release year is nil or empty, then this is false
        if !self.release_year.nil?

            # if the release year is greater than the current year, than add an error
            if self.release_year > Date.current.year
                errors.add(:release_year, "Can't release a song in the future")
            end
        end
    end

end