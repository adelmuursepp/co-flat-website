Rails.application.routes.draw do
  devise_for :users, only: :omniauth_callbacks, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users, skip: :omniauth_callbacks 
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
  end

end
