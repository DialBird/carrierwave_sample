Rails.application.routes.draw do
  get 'users/index'

  root 'home#index'
end
