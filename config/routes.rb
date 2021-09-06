Rails.application.routes.draw do
  devise_for :users
  devise_for :models
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "signup", to: "users#index"
  post 'signup', to: "users#create"

  # sessions
  get 'signin', to: 'sessions#index'
  post 'signin', to: "sessions#show"
  get 'logout', to: "sessions#logout"
  post 'logout', to: 'sessions#destroy'

  # recipes
  get '/recipes' ,to: 'recipes#index'
  get '/recipes/:id', to: 'recipes#show', as: 'show_recipe'
  get '/recipes_add', to: 'recipes#new'
  get '/recipes/:id/edit', to: 'recipes#edit', as: 'edit_recipe'
  post '/recipes', to: 'recipes#create'
  # should be in the front end
  patch '/recipes/:id/edit',to: 'recipes#update', as: 'recipe_edited'
  delete '/recipes/:id',to: 'recipes#destroy', as: 'recipes_delete'
  patch '/recipes/:id/recommend', to: 'recipes#recommend', as: 'recommend'


  # comments
  post "comment", to: 'comments#create'
  delete "comment", to: 'comments#destroy'
  get 'display_comments', to: 'comments#display'

  # root page
  root 'recipes#index'
end
