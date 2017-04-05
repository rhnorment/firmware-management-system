Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  namespace :v1 do
    resources :firmware_builds do
      get 'index',                  on: :collection
      get 'show',                   on: :member
      get 'latest',                 on: :collection
      get 'download_image',         on: :member
    end
  end

end
