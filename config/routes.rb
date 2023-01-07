Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # post '/questions', to: 'questions#create'
  # patch '/questions/:id', to: 'questions#update'
  # delete '/questions/:id', to: 'questions#destroy'

  root to: 'questions#index'

  resources :questions

  resources :users, param: :nickname, except: %i[index]

  # match '/:id', :to => "users#show", :as => :user, :via => :get
  # match '/:id', :to => "users#update", :as => :user, :via => :put
  # match '/:id', :to => "users#destroy", :as => :user, :via => :delete

  resource :session, only: %i[new create destroy]

end
