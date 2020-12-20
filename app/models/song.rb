class Song < ApplicationRecord
    include ActiveModel::Validations

    validates :title, :artist_name, presence: true

    validates_with Release_YearValidator
    validates_with ReleasedValidator
    validates_with TitleValidator

end
