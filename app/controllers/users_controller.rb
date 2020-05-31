class UsersController < ApplicationController
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
    def profile
        @userid = params[:user_id]
        @userinfo = User.find(params[:user_id])
        @usercount = @userinfo.tweets
        @tweets=Tweet.all
    end
end