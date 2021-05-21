Rails.application.routes.draw do
  get 'notifications/link_through'
  devise_for :users, only: :omniauth_callbacks, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users, skip: :omniauth_callbacks,
            path: '',
            path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration'},
            controllers: {registrations: 'registrations'}
   
    resources :users, only: [:show] do
      member do
        post '/verify_phone_number' => 'users#verify_phone_number'
        patch '/update_phone_number' => 'users#update_phone_number'
      end
    end
    resources :notifications, only: [:index]
    get 'notifications/:id/link_through', to: 'notifications#link_through', as: :link_through
   
    root to: 'apartments#index'
    get "apartments/new", to: "apartments#new"
    get "apartments/:id", to: "apartments#show", as: :apartment
    post "apartments", to: "apartments#create"
    get "apartments/:id/edit", to: "apartments#edit", as: :edit_apartment
    patch "apartments/:id", to: "apartments#update"
    delete "apartments/:id", to: "apartments#destroy"
    patch "bookings/:id/confirm", to: "bookings#confirm", as: :confirm_booking
    patch "bookings/:id/decline", to: "bookings#decline", as: :decline_booking
    patch "apartments/:id/activate", to: "apartments#activate", as: :activate_apartment
    patch "apartments/:id/deactivate", to: "apartments#deactivate", as: :deactivate_apartment
    resources :bookings, only: [ :create, :index, :show] do
      resources :payments, only: :new
    end
    resources :reservations, only: [ :create] do
      resources :payments, only: :new
    end
  end

end
