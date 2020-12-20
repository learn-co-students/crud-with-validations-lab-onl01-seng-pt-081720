class TitleValidator < ActiveModel::Validator
    def validate(record)
        songs = Song.all
        songs.each do |s|
            if s.title == record.title
                if s.release_year == record.release_year
                    if s.artist_name == record.artist_name
                        record.errors[:release_year] << "Cannot be repeated by the same artist in the same year"
                    end
                end
            end
        end
    end
end