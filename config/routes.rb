Rails.application.routes.draw do
  root 'users#index'

  resources :users do
    collection do
      post :confirm
    end
  end
end
