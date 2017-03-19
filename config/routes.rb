Rails.application.routes.draw do

  namespace :api, path: '/', constraints: { subdomain: 'api' } do
    resources :firmware_builds, only: [:index]
  end

end
