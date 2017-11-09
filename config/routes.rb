Rails.application.routes.draw do
  resources :cocktails, only: [:index, :new, :create, :show] do
    resources :doses, only: [:new, :create, :destroy]
  end
  resources :doses, only: [:destroy]
end
