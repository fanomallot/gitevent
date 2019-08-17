Rails.application.routes.draw do
  devise_for :users
 get '/',to: 'events#index'
 
 resources :users
 resources :events do
 	resources :participations
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
