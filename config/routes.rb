Rails.application.routes.draw do

  devise_for :users

  resources :users, only: [:index, :show, :edit]
  
  resources :celebs, only: [:index, :show]

  resources :messages, only: [:index, :show, :new, :create]

  root 'pages#welcome'

  ## static pages - need new way to avoid having to update all files when adding a static page
  get '/welcome' => 'pages#welcome'
  get '/home' => 'pages#home'
  get '/about' => 'pages#about'
  get '/contact' => 'pages#contact'
  # /about-astrology
  # /why-vedic
  # /help

  ## facades

  # dashboard
  get '/dashboard' => 'dashboards#show'



  # get 'profile', to: 'users#show'

  # route draft notes
  # modules

  # dashboard
    # dashboard index -> 
      # chart intro
      # random celebs
      # random match
      # random community
  

#user -> has_one
  # chart
    
    # chart index ->
      # chart Vedic
      # chart Western
      # chart astrologer view
    
    # chart create ->

    # chart_other index ->
      # chart Vedic
      # chart Western
      # chart astrologer view

    
  # compare

    #compare index ->
      # compare major
      # compare minor
      # compare other

  # community 

    # community index ->
      # all users
      # search
      # facebook friends

  # favorites

    # favorites index ->
      # all favorites
      # search
      # facebook friends

    # favorites create ->
      # add favorite

    # favorites destroy ->
      # remove favorites

  # custom chart

    # custome chart index ->
      # birth info

    # custom chart index -> -- Can this be from chart_other and profile_other?
      # chart Vedic
      # chart Western
      # chart astrologer view
      # invite button

    # cutstom chart compare index -> -- Can this be from compare?
      # compare major
      # compare minor
      # compare other

  # celebrities

    # celebrities show ->
      # all celebs
      # search

  # inbox

    # inbox -> index
      # messages
      # new message

    # inbox show ->
      # message history

    # inbox create -> 
      # new message

  # settings

    # settings -> index
      # all preferences

    # settings update -> 
      # setting to update

end
