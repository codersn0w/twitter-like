class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
    def profile
        @userid = params[:user_id]
        @userinfo = User.find(params[:user_id])
        @usercount = @userinfo.tweets
        @tweets=Tweet.all
    end
    protected
    # my custom fields are :name, :heard_how
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :bio, :email, :password, :password_confirmation])
        devise_parameter_sanitizer.permit(:account_update, keys:[:username, :bio, :email, :password, :password_confirmation, :current_password])
    end
end
