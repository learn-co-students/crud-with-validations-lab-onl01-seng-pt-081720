class Release_YearValidator < ActiveModel::Validator
    def validate(record)
        if record.release_year.present? && record.release_year > Time.now.year
            record.errors[:release_year] << "Must be less than or equal to the current year"
        end
    end
end