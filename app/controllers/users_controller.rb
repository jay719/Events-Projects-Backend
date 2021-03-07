class UsersController < ApplicationController
    def index 
        @user = User.all

        render json: {user: @user}
    end

    def create
        @user = User.create(
            username: params[:username],
            password: params[:password]
        )  
        render json: {user: @user}
    end
end 
