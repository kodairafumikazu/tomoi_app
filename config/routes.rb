Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  resources :shops, only: [:index, :show]
  resources :shop_guides, only: :index
  resources :accesses, only: :index

  root to: "products#index"
  resources :products do
    resources :orders, only: [:create, :index]
  end
end
