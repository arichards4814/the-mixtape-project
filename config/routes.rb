Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

    root 'pages#main'

    resources :users, only: [:create, :show, :edit, :update]
    resources :mixtapes
    resources :badges, only: [:index ,:new, :create, :show, :edit, :update]


    ## should change our users route to /signup
    get '/signup', to: 'users#new', as: "new_user"
    #get '/profile' to: 'users#show', 
    #get '/:username', to: 'users#show', as: "user"


    get '/login', to: 'pages#login', as: 'login'
    post '/logged', to: 'pages#create', as: 'logged'
    post '/logout', to: 'pages#destroy', as: 'logout'
    delete '/users/:id', to: "users#destroy"

    get '/profile', to: 'users#profile', as: 'profile'
    get '/profile/badges', to: 'users#badges', as: 'profile_badges'
    post '/profile/badges/:id', to: 'users#change_badge', as: 'change_badge'

    ##get '/login' to: 'sessions#new'
    ##post '/sessions' to: 'sessions#create'
    ##delete '/sessions' to: 'sessions#destroy'

end
