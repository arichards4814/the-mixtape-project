Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

    root 'pages#main'

    resources :users, only: [:new, :create, :show, :edit, :update]
    resources :mixtapes
    resources :badges, only: [:index ,:new, :create, :show, :edit, :update]


    ## should change our users route to /signup
    #get '/signup' to: 'users#new', as: "new_user"
    get '/login', to: 'pages#login', as: 'login'
    post '/', to: 'pages#create', as: 'logged'
    post '/logout', to: 'pages#destroy', as: 'logout'
    delete '/users/:id', to: "users#destroy"

end
