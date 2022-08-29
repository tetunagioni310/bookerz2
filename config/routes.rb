Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    registrations: 'users/registrations'
    }
  
  root 'home#top'
  get 'home/about', to: 'home#about'
  resources :books, only: [:index,:show,:edit]
  resources :users, only: [:index,:show,:edit]
end
