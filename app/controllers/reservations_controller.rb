class ReservationsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:create]
   
    def create
        apartment = Apartment.find(params[:apartment_id])

        start_date = Date.parse(reservation_params[:start_date])
        end_date = Date.parse(reservation_params[:end_date])

        nights = (end_date - start_date).to_i

        

        if current_user
          booking  = Booking.new(apartment: apartment, user_id: current_user, state: 'pending', description: description) # Currently doesn't require login 
        else
          test_user = User.find(13)
          booking  = Booking.new(apartment: apartment, user_id: test_user.id, state: 'pending', description: description) # Currently doesn't require login 
        end

        # will have to be changed to test user

        if booking.save
          notification = create_notification(apartment, description)
          flash[:notice] = "Sõnum saadetud"
          NotificationMailer.with(notification: notification).notification_email.deliver_later
          respond_to do |format|
            format.html { redirect_to apartment_path(apartment) }
            format.js
          end
        end
      
        # session = Stripe::Checkout::Session.create(
        #   payment_method_types: ['card'],
        #   line_items: [{
        #     name: apartment.id,
        #     images: [apartment.photos[0]],
        #     amount: apartment.rent_cents,
        #     currency: 'eur',
        #     quantity: 1
        #   }],
        #   success_url: booking_url(booking),
        #   cancel_url: booking_url(booking)
        # )
      
        # booking.update(checkout_session_id: session.id)
        # redirect_to bookings_path
        # redirect_to new_booking_payment_path(booking)
    end

    def confirm
      @booking = Booking.find(params[:id])
      @booking.status = "confirmed"
      @booking.apartment.status = "inactive"
      @booking.apartment.save
      @booking.save
      redirect_to bookings_path
    end

    def decline
      @booking = Booking.find(params[:id])
      @booking.status = "declined"
      @booking.save
      redirect_to bookings_path
    end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end

  def create_notification(apartment, description)
    if current_user # this is needed in case the user not logged in and wants to send a message
      return if apartment.user.id == current_user.id 
    end
    notification = Notification.create!(user_id: apartment.user.id,
                          apartment_id: apartment.id,
                          description: description,
                          notice_type: 'Sõnum')
    return notification
  end

end
