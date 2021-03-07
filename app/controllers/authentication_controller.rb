class AuthenticationController < ApplicationController
    def login
        @user = User.find_by username: params[:username]
        if !@user 
            render json: { error: "Not one of ussss"}, status: :unauthorized
        else
            if !@user.authenticate params[:password]
                render json: { error: "Does thy not know ye old code aye?" }, status: :unauthorized
            else
                payload = {
                    user_id: @user.id
                }
                secret = Rails.application.secret_key_base
                token = JWT.encode(payload, secret)
                render json: {token: token}, status: :created
            end

        end
    end
end
