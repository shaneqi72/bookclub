class Book < ApplicationRecord
    enum status: [:in_stock, :out_of_stock, :banned]
    resourcify
     belongs_to :author
     has_many :book_genres, dependent: :destroy
     has_many :genres, through: :book_genres

     has_one_attached :cover_image, dependent: :destroy
    #  validate :has_genre

     validates :title, presence: {message: "Please provide a title"}
    #  validates :date_published, presence: true
     validates :date_published, presence: {message: "Please provide a publish date"}
     validate :past_date
    #  validates :price, numericality: {only_integer: true}
    #  validates :price, numericality: {greater_than_or_equal_to: 0}
    #  validates :name, presence: true
    #  validates :description, length: {minimun: 10, too_short: "%{count} is the minium number of characters!"
    #  validates :description, length: {in: 10..100, too_short: "%{count} is the minium number of characters!"

    scope :bargin, -> { where(price: 0..500)}
    scope :find_in_stock, -> { where(status: 'in_stock')}
    scope :find_out_of_stock, -> { where(status: 'out_of_stock')}
    scope :find_banned, -> { where(status: 'banned')}

    scope :find_between, -> (date1, date2) { where("due_date > #{date1} ? AND due_date < #{date2}")}


    # def has_genre

    #     errors.add(:genre, "Must provide genre") if genres.length == 0
    # end

    def add_genre(genre)
        genres.push(genre)
    end

    def past_date
        if date_published >= Date.today
            errors.add(:date_published, "must be in the past")
        end
    end
end
