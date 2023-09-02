Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  
  root "users#index"

  resources :users do
    resources :posts do
      resources :comments
      resources :likes
    end
  end
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :users do
        resources :posts do 
          resources :comments 
        end
      end
    end
  end

end

