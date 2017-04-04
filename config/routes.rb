Rails.application.routes.draw do
  root to: 'playlists#index'
  resources :playlists
  devise_for :users, controllers: { sessions: 'users/sessions', :omniauth_callbacks => "users/omniauth_callbacks" }
end
