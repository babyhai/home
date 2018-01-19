Rails.application.routes.draw do
  root to: 'topics#index'
  devise_for :users
  mount Homeland::Engine, at: "/bbs"


end
