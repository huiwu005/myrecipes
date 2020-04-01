# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  root "pages#home"
  get "pages/home", to: 'pages#home'
  
  resources :recipes do
    # nesting comments in receipe
    # recipe_comments POST   /recipes/:recipe_id/comments(.:format) comments#create
    resources :comments, only: [:create] 
  end
  get '/signup', to: 'chefs#new'
  resources :chefs, except: [:new]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :ingredients, except: [:destroy]

  mount ActionCable.server => '/cable'
end
