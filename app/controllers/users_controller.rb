class UsersController < ApplicationController
    skip_before_action :authenticate_user!, only: [ :show]
    def show
        @user = User.find(params[:id])
        @active_apartments = Apartment.where(user_id: @user.id, status: "active")
        @inactive_apartments = Apartment.where(user_id: @user.id, status: "inactive")
        @likes = Like.where(user_id: @user.id)
    end
end