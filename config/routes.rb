Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'bookings#new'

  resources :bookings, only: %i[index new create]
end
