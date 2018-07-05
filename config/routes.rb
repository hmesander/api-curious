Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  get '/auth/github', as: :github_login
  get '/auth/github/callback', to: 'sessions#create'
  get '/dashboard', to: 'dashboard#index'
  get '/logout', to: 'sessions#destroy'
  get '/:nickname/repos', to: 'repos#index'
  get '/events', to: 'events#index'
  get '/:nickname/organizations', to: 'orgs#index'

  resources :users, only: [:show]
end
