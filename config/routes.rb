Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users

  resources :properties, only: [:show, :index]

  resources :users, only: :index do
    resources :properties, shallow: true do
      resources :images, only: %i[create destroy index update], shallow: true
    end
  end
end
