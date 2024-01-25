Rails.application.routes.draw do
  resources :train_operators do
    collection do
      get 'available_trains', to: 'train_operators#available_trains'
      post 'create', to: 'train_operators#create'
      post 'show', to: 'train_operators#show'
      post 'best_fit', to: 'train_operators#best_fit'
    end
  end

  resources :parcels, only: [:index]

  resources :offers, only: [:index]

  resources :bookings do
    collection do
      get 'booked_trains', to: 'bookings#booked_trains'
      put 'booking_status', to: 'bookings#booking_status'
    end
  end

  resources :bids
end
