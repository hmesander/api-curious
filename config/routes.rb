Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  get '/auth/github', as: :github_login
  get '/auth/github/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: :logout
  get '/:nickname', to: 'users#show'
  get '/:nickname/repos', to: 'repos#index'
  get '/:nickname/events', to: 'events#index'
  get '/:nickname/organizations', to: 'orgs#index'
end
