Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # post '/questions', to: 'questions#create'
  # patch '/questions/:id', to: 'questions#update'
  # delete '/questions/:id', to: 'questions#destroy'

  root to: 'questions#index'

  resources :questions

  resource :session, only: %i[new create destroy]

  resources :users, only: %i[new create edit update destroy]
end
