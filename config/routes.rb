# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  root "pages#home"
  get "pages/home", to: 'pages#home'
  
  # get '/recipes',     to: 'recipes#index'
  # get '/recipes/new', to: 'recipes#new', as: :new_recipe
  # get '/recipes/:id', to: 'recipes#show', as: :recipe
  # post '/recipes', to: 'resipes#create'
  resources :recipes
end
