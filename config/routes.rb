Rails.application.routes.draw do
  devise_for :users

  resources :hotels, only: :index do
    get :search, on: :collection
  end
  resources :reservations, only: [ :new, :create ]
  namespace :administrators do
    resources :hotels
  end
  root "hotels#index"
end
