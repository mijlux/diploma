Rails.application.routes.draw do
  root to: 'pages#home'
  #root to: 'travels#index'

  get 'travels/filter', to: 'travels#filter'
  get 'travels/random', to: 'travels#random'

  resources :users

  resources :travels do
    member do
      post 'add_to_favorites'
    end
  end

  resources :travels



  resource :session, only: %i[new create destroy]

  get "/pages/:page" => "pages#show"

end
