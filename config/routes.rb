Rails.application.routes.draw do
  resources :articles
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post '/new_user_reaction', to: 'reactions#new_user_reaction', as: 'new_user_reaction'
  resources :comments, only: [:create]

  # Defines the root path route ("/")
  root "articles#index"
end
