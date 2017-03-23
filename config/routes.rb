Rails.application.routes.draw do

  root to: 'admin/dashboard#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  namespace :api, path: '/', constraints: { subdomain: 'api' } do
    resources :firmware_builds, only: [:index, :show]
  end

end
