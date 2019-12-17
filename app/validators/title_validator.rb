class TitleValidator < ActiveModel::Validator
    def validate(record)
        if /(Won't Believe)|(Secret)|(Top [0-9])|(Guess)/.match?(record.title) == false
            record.errors[:title] << "Title is not sufficiently clickbait-y"
        end
    end
end