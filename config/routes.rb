Rails.application.routes.draw do
  resources :hotels, only: :index do
    get :search, on: :collection
  end
  devise_for :users
  root "hotels#index"
end
