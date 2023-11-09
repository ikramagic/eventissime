class AvatarsController < ApplicationController

    def create
        @user = current_user
        current_user.avatar.attach(params[:avatar])
        redirect_to(user_path(current_user))
    end

end
