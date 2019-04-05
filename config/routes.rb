require 'sidekiq/web'

Rails.application.routes.draw do
  resources :cars do
    resources :renters
  end
  get '/payment/:car_id/:renter_id', to: 'rentings#payment', as: 'payment'
  post '/payment/:car_id/:renter_id', to: 'rentings#pay', as: 'pay'
  namespace :admin do
      resources :users
      resources :announcements
      resources :notifications
      resources :services

      root to: "users#index"
    end
  get '/privacy', to: 'home#privacy'
  get '/terms', to: 'home#terms'
    authenticate :user, lambda { |u| u.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    end


  resources :notifications, only: [:index]
  resources :announcements, only: [:index]
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
# get "fill_balance/:id" => "drivers#fill_balance", as: "fill_balance", on: :collection
# patch "filling_balance/:id" => "drivers#filling_balance", as: "filling_balance", on: :collection