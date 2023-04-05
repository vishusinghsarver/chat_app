class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?, only: [:create]
    before_action :configure_permitted_parameters_update, if: :devise_controller?, only: [:update]
    protect_from_forgery

    # rescue_from ActionController::Redirecting::UnsafeRedirectError do
    #   redirect_to index
    # end
    def configure_permitted_parameters
          devise_parameter_sanitizer.permit(:sign_up, keys: [:name,
                                                            :sarname,
                                                            :email,
                                                            :password,
                                                            :image,
                                                            :encrypted_password,
                                                            :reset_password_token,
                                                            ])

    end   
  def configure_permitted_parameters_update
    
        devise_parameter_sanitizer.permit(:account_update, keys: [:name,
                                                                  :sarname,
                                                                  :email,
                                                                  :password,
                                                                  :image,
                                                                  :encrypted_password,
                                                                  :reset_password_token,
                                                                  ])

  end
end
