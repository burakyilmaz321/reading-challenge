Rails.application.routes.draw do
  root 'readings#index'
  resources :readings, only: [:index, :new, :create, :edit, :update, :destroy]

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
