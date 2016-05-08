Rails.application.routes.draw do

  root 'static_pages#welcome'

  get 'welcome' => 'static_pages#welcome'

  get 'admin' => "admins#show"
  get 'other' => "admins#other"



  resources :categories

  resources :products

  resources :users do
    resources :carts, only: [:index, :create, :update, :destroy]
    resources :orders, only: [:new, :create, :show]
  end



  resources :sessions, only: [:new, :create, :destroy]

end
