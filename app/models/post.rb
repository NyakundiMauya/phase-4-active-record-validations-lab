class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }

    validate :clickbait_title

    def clickbait_title
      clickbait_phrases = ["Won't Believe", "Secret", "Top", "Guess"]
      unless clickbait_phrases.any? { |phrase| title.to_s.include?(phrase) }
        errors.add(:title, "must be clickbait")
      end
    end
    
end
