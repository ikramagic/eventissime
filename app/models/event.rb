class Event < ApplicationRecord
    has_many :attendances, dependent: :destroy
    has_many :users, through: :attendances, dependent: :destroy
    belongs_to :admin, class_name: 'User', foreign_key: 'admin_id'

    
    validates :start_date, presence: true
    validate :start_date_cannot_be_in_the_past
    validates :duration, presence: true, numericality: { greater_than: 0 }
    validate :divisible_by_5
    validates :title, presence: true, length: { minimum: 5, maximum: 140 }
    validates :description, presence: true, length: { minimum: 20, maximum: 1000 }
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 1000 }
    validates :location, presence: true

    def divisible_by_5
        if duration.present? && duration % 5 != 0
            errors.add(:duration, "Sorry, the duration must be a multiple of 5")
        end
    end

    def start_date_cannot_be_in_the_past
        if start_date.present? && start_date < DateTime.now
            errors.add(:start_date, "Sorry, the event can't be in the past")
        end
    end
end