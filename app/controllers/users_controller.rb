class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @active_apartments = Apartment.where(user_id: @user.id, status: "active")
        @inactive_apartments = Apartment.where(user_id: @user.id, status: "inactive")
    end
end