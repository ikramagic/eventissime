class Attendance < ApplicationRecord
    belongs_to :user
    belongs_to :event
    after_create :confirmation_email

    def confirmation_email
        UserMailer.confirmation_email(user, event).deliver_now
    end
end