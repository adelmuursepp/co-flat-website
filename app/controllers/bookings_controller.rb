class BookingsController < ApplicationController
    def index
      @active_apartments = Apartment.where(user_id: current_user.id, status: "active")
      @inactive_apartments = Apartment.where(user_id: current_user.id, status: "inactive")
      @pending_bookings = Booking.where(user_id: current_user.id, status: "pending")
      @accepted_bookings = Booking.where(user_id: current_user.id, status: "accepted")
      @declined_bookings = Booking.where(user_id: current_user.id, status: "declined")
    end
    def create
        apartment = Apartment.find(params[:apartment_id])
        description = params[:description]
        booking  = Booking.create!(apartment: apartment, state: 'pending', user: current_user, description: description)
      
        session = Stripe::Checkout::Session.create(
          payment_method_types: ['card'],
          line_items: [{
            name: apartment.id,
            images: [apartment.photos[0]],
            amount: apartment.rent_cents,
            currency: 'eur',
            quantity: 1
          }],
          success_url: booking_url(booking),
          cancel_url: booking_url(booking)
        )
      
        booking.update(checkout_session_id: session.id)
        redirect_to bookings_path
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

end
