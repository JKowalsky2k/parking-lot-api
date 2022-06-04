Rails.application.routes.draw do
  resources :parkings
  root to: 'static#index'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get '/parking_slots/:id/book', to: 'parking_slots#book'
  get '/parking_slots/:id/book_off', to: 'parking_slots#book_off'

  get '/parking_slots/:id/add', to: 'parking_slots#add'
  get '/parking_slots/:id/remove', to: 'parking_slots#remove'

  get    '/summary',   to: 'static#summary'

  resources :parking_slots
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
