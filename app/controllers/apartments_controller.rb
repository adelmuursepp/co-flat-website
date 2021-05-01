class ApartmentsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:index, :show]

    def index
        if params[:search].present?
            @apartments = Apartment.near(params[:search], 50, order: :distance)
            @active_apartments = @apartments.where(status: "active")

            @markers = @active_apartments.geocoded.map do |apartment|
                {
                    lat: apartment.latitude,
                    lng: apartment.longitude,
                    infoWindow: render_to_string(partial: "info_window", locals: { apartment: apartment })
                }
                end
        else
            @active_apartments = Apartment.where(status: "active")
            @inactive_apartments = Apartment.where(status: "inactive")

            # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
            @markers = @active_apartments.geocoded.map do |apartment|
            {
                lat: apartment.latitude,
                lng: apartment.longitude,
                infoWindow: render_to_string(partial: "info_window", locals: { apartment: apartment })
            }
            end
        end
        
    end

    def show
        @apartment = Apartment.find(params[:id])
        @markers = 
            [{
                lat: @apartment.latitude,
                lng: @apartment.longitude,
                infoWindow: render_to_string(partial: "info_window", locals: { apartment: @apartment })
            }]
       
    end

    def new
        @apartment = Apartment.new
    end


    def create
        @apartment = Apartment.new(apartment_params)
        @apartment.user_id = current_user.id
        if @apartment.save
            redirect_to apartment_path(@apartment), notice: "Kuulutus on avalik. Muuda või arhiveeri kuulutus vaates üles pandud kuulutused."
        else
            # redirect_to apartments_new_path
            render :new, alert: "Something went wrong"
        end
    end

    def edit
        @apartment = Apartment.find(params[:id])
    end

    def update
        @apartment = Apartment.find(params[:id])
        if @apartment.update(apartment_params)
            flash[:notice] = "Muudatused salvestatud"
            redirect_back(fallback_location: request.referer)
        else
            # flash[:notice] = "Salvestamisel esines üks või mitu viga"
            render :edit
        end
        # redirect_to apartment_path(@apartment)
        # redirect_back(fallback_location: request.referer)
    end

    def destroy
        @apartment = Apartment.find(params[:id])
        @apartment.bookings.destroy_all
        @apartment.destroy

        redirect_to user_path(current_user)
    end

    def activate
        @apartment = Apartment.find(params[:id])
        @apartment.status = "active"
        @apartment.save
        redirect_to user_path(current_user.id)
    end

    def deactivate
        @apartment = Apartment.find(params[:id])
        @apartment.status = "inactive"
        @apartment.save
        redirect_to user_path(current_user.id)
    end

    private

    def apartment_params
        params.require(:apartment).permit(:name, :intro, :city, :rent, :description, :date, :show_address, :main_photo, :address,
        :house_number, :zip_code, :longitude, :latitude, :deposit, :available, :available_until, :minimum_stay_in_months,
        :room_size_m2, :apartment_size_m2, :bed_type, :bathrooms_number, :bathroomnumber, :flatmates_female, :flatmates_male, 
        :min_preferred_flatmate_age, :max_preferred_flatmate_age, :preferred_flatmate_is_male, :preferred_flatmate_is_female,
        :is_wifi, :is_tv, :is_washing_machine, :is_lift, :is_furniture, :is_terrace, :is_balcony, :is_garden, 
        :is_parking, :is_private_bathroom, :is_dishwasher,:room_type, :preferred_gender, :is_desk, :is_pet_friendly, :is_smoker_friendly, :is_couples_friendly,
        :propertytype, :neighborhood, :bedroomnumber, :roomnumber, :is_bookable, :photos_order, photos: [])
        .tap do |whitelisted_params|
            photos = []
            params[:photos_order]&.split(',').map(&:to_i).each do |i|
                photos << whitelisted_params[:photos][i - 1]
            end

            whitelisted_params[:photos] = photos
        end
    end
end
