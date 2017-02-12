Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations'  }
  resources :messages do
    resources :comments
  end
  root 'messages#index'
end
