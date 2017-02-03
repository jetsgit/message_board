Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations'  }
  resources :messages
  root 'messages#index'
end
