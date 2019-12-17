
class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :title_clickbait

    def title_clickbait
        # binding.pry
        if title == nil
            errors.add(:title, "error")
        elsif title.include? "Won't Believe"
            return true
        elsif title.include? "Secret"
            return true
        elsif title.include? "Top [number]"
            return true
        elsif title.include? "Guess"
            return true
        else
            # binding.pry
            errors.add(:title, "error")
        end 
        # cb = ["Won't Believe", "Secret", "Top [number]", "Guess"]
    end

end

