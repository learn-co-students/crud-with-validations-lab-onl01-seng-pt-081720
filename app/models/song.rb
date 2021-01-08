class Song < ActiveRecord::Base
    validates :title, presence: true
    validates :title, uniqueness: true
    validates :release_year, presence: false, if: :released == false
end