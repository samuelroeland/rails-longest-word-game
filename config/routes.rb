Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "pages#home"

  get "/answer", to:"pages#answer"
  post "/answer", to:"pages#answer"


  get "/game", to:"pages#game"

end
