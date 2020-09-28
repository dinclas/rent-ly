Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      namespace :fipe do
        get :brands
        get 'brands/:brand_id/models', action: :models
      end
    end
  end

  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'bookings#new'

  resources :bookings, only: %i[index new create]
end
