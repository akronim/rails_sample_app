Rails.application.routes.draw do
  root "static_pages#home"
  get "help" => "static_pages#help"
  get "about" => "static_pages#about"
  get "contact" => "static_pages#contact"
  get "signup" => "users#new"
  get "login" => "sessions#new" # page for a new session (login)
  post "login" => "sessions#create" # create a new session (login)
  delete "logout" => "sessions#destroy" # delete a session (log out)
  # to get the routing for /users/1 to work
  resources :users
end
