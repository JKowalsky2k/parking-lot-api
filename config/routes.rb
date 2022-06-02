Rails.application.routes.draw do
  root to: 'static#index'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get '/parking_slots/:id/book', to: 'parking_slots#book'
  get '/parking_slots/:id/book_off', to: 'parking_slots#book_off'

  resources :parking_slots
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
