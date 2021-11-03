class Author < ApplicationRecord
    has_many :books, dependent: :destroy

    def full_name
        return "#{first_name} #{last_name}"
    end
end
