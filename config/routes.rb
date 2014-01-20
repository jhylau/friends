Friends::Application.routes.draw do

  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}, controllers: {omniauth_callbacks: "omniauth_callbacks"}

  root :controller => "flight_searches", :action => 'index'

  resources :flight_searches
  resources :flights 
  resources :hotels
  match "flight-deals", :to => "flight_deals#index", :via => [ :get ]
  match "how-it-works", :to => "flight_deals#index", :via => [ :get ]

end
