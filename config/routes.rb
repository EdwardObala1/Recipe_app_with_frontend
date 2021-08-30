Rails.application.routes.draw do
  devise_for :users
  devise_for :models
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "signup", to: "users#index"
  root "users#index"
  post 'signup', to: "users#create"

  # sessions
  get 'signin', to: 'sessions#index'
  post 'signin', to: "sessions#show"
  get 'logout', to: "sessions#logout"
  post 'logout', to: 'sessions#destroy'

  # recipes
  get '/recipes' ,to: 'recipes#index'
  get '/recipes/:id', to: 'recipes#show'
  post '/recipes', to: 'recipes#create'
  # should be in the front end
  patch '/recipes/:id',to: 'recipes#update', as: 'recipes_edit'
  delete '/recipes/:id',to: 'recipes#destroy', as: 'recipes_delete'
  patch '/recipes/:id/recommend', to: 'recipes#recommend', as: 'recommend'


  # comments
  post "post_comment", to: 'comments#add'
  post "delete_comment", to: 'comments#delete'
  get 'display_comments', to: 'comments#display'
end
