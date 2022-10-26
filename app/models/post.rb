class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}

    #Custom Validation
    validate :title_is_clickbait

    KEYWORDS = [
        /Won't Believe/i, 
        /Secret/i, 
        /Top \d/i, 
        /Guess/i
    ]

    def title_is_clickbait
        
        if KEYWORDS.none? { |word| word.match title}
            errors.add(:title, "must be a clickbaity title")
        end
    end
end
