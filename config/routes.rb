Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  get '/login/oauth/authorize', as: :github_login, to: 'sessions#create'
  get '/dashboard', to: 'dashboard#index'
end
