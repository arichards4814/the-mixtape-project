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


    get '/search/:id', to: 'songs#search', as: 'search'
    get '/found', to: 'songs#found', as: 'found'
    get '/albums/:id', to: 'songs#albums', as: 'albums'
    get '/songs/:id', to: 'songs#songs', as: 'songs'
    post '/add_song', to: 'songs#add_song', as: 'add_song'

    post 'like/:id', to: 'mixtapes#like', as: 'like'

    get 'preview_send_mixtape/:id', to: 'mixtapes#preview_send_mixtape', as: 'preview_send_mixtape'
    post 'send_mixtape/:id', to: 'mixtapes#send_mixtape', as: 'send_mixtape'
    get  'profile/loved', to: 'users#loved', as: "loved"

    get 'auth/spotify/callback', to: 'mixtapes#spotify'
    post '/spotify_add_playlist/:id', to: 'mixtapes#spotify_add_playlist', as: "spotify_add_playlist"

    get '/spotify_landing', to: 'mixtapes#spotify_landing', as: "spotify_landing"


    ## need to do one for remove song

    ##get '/login' to: 'sessions#new'
    ##post '/sessions' to: 'sessions#create'
    ##delete '/sessions' to: 'sessions#destroy'

end
