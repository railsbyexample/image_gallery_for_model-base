Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users

  resources :properties do
    resources :images, only: %i[create destroy index], shallow: true
  end
end
