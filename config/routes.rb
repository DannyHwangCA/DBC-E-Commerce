Rails.application.routes.draw do

  root 'static_pages#welcome'

  get 'welcome' => 'static_pages#welcome'

  get 'admin' => "admins#show"



  resources :categories

  resources :products

  resources :users do
    resources :carts, only: [:index, :create, :update, :destroy]
  end



  resources :sessions, only: [:new, :create, :destroy]

end
