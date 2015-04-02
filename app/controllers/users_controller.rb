class UsersController < ApplicationController

    def index
        @users = User.all
    end

    def show
        username = params[:id]
        @user = User.find_by username: username

        if !@user
            @error_msg = "Sorry, there is no user called ~#{username}"
            render 'shared/404'
        end
    end

end
