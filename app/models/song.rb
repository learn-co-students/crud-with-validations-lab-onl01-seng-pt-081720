class Song < ActiveRecord::Base
    validates :title, presence: true
    validates :title, uniqueness: true
    validates :release_year, presence: false, if: :released == false
    #validates :release_year == Time.current.year

    def current_year
        Time.current.year
    end
end