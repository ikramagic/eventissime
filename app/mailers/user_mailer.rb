class UserMailer < ApplicationMailer
  default from: 'lionel.micro.claira@gmail.com'

    def welcome_email(user)
      @user = user 
    
      @url = 'http://eventissime-4f42df2520e7.herokuapp.com' 
    
      mail(to: @user.email, subject: 'Bienvenue chez Eventissime !') 
    end

    def confirmation_email(user, event)
      @user = user
      @event = event
      mail(to: @user.email, subject: 'Participation Confirmation')
  end
end