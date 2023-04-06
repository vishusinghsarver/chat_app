class UsersController < ApplicationController
    before_action :set_user, only: %i[ edit update ]
    skip_before_action :verify_authenticity_token
    before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
    
    def list
        @users=User.where(:role => "user")
    end

    def show
    end

    def new
    end

    def edit
    end

    def update
        if @user.approved == true && params[:action] == "update"
            @user.update(approved:false)
            redirect_to root_path
        elsif params[:action] == "update"
            @user.update(approved:true)
            redirect_to root_path
        end
    end

    private
    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:id,:name,:sarname,:email,:password,:image)
    end
end
