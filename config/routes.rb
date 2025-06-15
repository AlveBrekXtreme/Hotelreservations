Rails.application.routes.draw do
  resources :hotels, only: :index do
    get :search, on: :collection
  end
  resource :reservation, only: [ :new, :create ]
  devise_for :users
  root "hotels#index"
end
