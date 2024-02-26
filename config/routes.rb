Rails.application.routes.draw do
  get 'bookings/new'
  get 'bookings/create'
  get 'ponies/index'
  get 'ponies/show'
  get 'ponies/new'
  get 'ponies/create'
  devise_for :users
  root to: "pages#home"

  get "dashboard", to: "pages#dashboard"

  resources :ponies do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [] do
    member do
      patch :accept
      patch :decline
    end
  end
end
