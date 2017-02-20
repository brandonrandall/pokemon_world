Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "pokemons#index"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  get "/executive", to: "executives#index"

  resources :users, only: [:new,
                          :create,
                          :show,
                          :index]

  resources :admins, only: [:new, :show]


  resources :pokemons, only: [:new,
                              :create,
                              :show,
                              :index,
                              :destroy]
end
