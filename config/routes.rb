Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get 'welcome/home', to: 'welcome#home'
  #get "/users/:id", to: "users#show"

  resources :users do
    resources :posts
  end

end
