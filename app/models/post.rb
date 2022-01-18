class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}
    validate :click_bait_check

    def fiction_or_not
        if category == "Fiction"
            true
        elsif category == "Non-Fiction"
            true
        else
            false
        end
    end
    
    def click_bait_check
        if title == 'True Facts'
            errors.add( :title, "sorry, this is clickbait")
        end
    end
end
