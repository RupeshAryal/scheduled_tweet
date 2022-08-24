class PasswordResetsController < ApplicationController

    def new
    end

    def create
        @user = User.find_by(email: params[:email])

        if @user.present?
            #send emil
            PasswordMailer.with(user: @user).reset.deliver_now
        end
        redirect_to root_path, notice: "Please check your email to reset your password."
        
    end

    def edit
        @user = User.find_signed(params[:token], purpose: "password_reset")
    end

end