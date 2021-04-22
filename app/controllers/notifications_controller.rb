class NotificationsController < ApplicationController
  
  def index
    @notifications = Notification.where(user_id: current_user.id).order('created_at DESC')
  end

  def link_through
    @notification = Notification.find(params[:id])
    @notification.update read: true
    redirect_to notifications_path
  end
end
