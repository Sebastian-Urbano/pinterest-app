Rails.application.routes.draw do
  devise_for :users
  get 'pages/index'
  get 'pages/home'
  root 'pins#index'

  post 'pins/:id/like', as: 'pins_like', to: 'pins#like'
#rest routes
  resources :pins

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
