Rails.application.routes.draw do
  resources :hashtags
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # post '/questions', to: 'questions#create'
  # patch '/questions/:id', to: 'questions#update'
  # delete '/questions/:id', to: 'questions#destroy'

  root to: 'questions#index'

  resources :questions

  resources :users, param: :nickname, except: %i[index]

  resource :session, only: %i[new create destroy]

end
