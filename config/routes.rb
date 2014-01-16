Friends::Application.routes.draw do

  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}, controllers: {omniauth_callbacks: "omniauth_callbacks"}

  root :controller => "home", :action => 'index'

  resources :flight_searches
  resources :flights 
  resources :hotels
  resources :deals
end
