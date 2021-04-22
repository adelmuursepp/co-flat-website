class NotificationMailer < ApplicationMailer
    def notification_email
        @notification = params[:notification]
    
        mail(to: @notification.user.email, subject: "Uus teavitus")
    end
end
