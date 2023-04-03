class UsersController < ApplicationController
    before_action :set_user, only: %i[ edit update show ]
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

        if @user.approved
            @user.update(approved:false)
        else 
          @user.update(approved:true)
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
