Rails.application.routes.draw do

  resources   :firmware_builds, only: [:index, :show]

end
