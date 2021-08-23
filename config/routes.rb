Rails.application.routes.draw do
  resources :users
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :user, only: [] do
        member do
          get :balance, controller: :users
          get :feed, controller: :users
          post :payment, controller: :users
        end
      end
    end
  end
end
