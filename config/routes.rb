Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users do
        resources :subscriptions, only: [:index, :create, :update]
      end
    end
  end
end