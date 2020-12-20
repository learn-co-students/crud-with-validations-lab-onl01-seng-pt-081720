class ReleasedValidator < ActiveModel::Validator
    def validate(record)
        if record.released == true && record.release_year == nil 
            record.errors[:released] << "Must be true or false"
        end
    end
end