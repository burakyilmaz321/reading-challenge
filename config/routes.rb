Rails.application.routes.draw do
  root 'readings#index'
  resources :readings, only: [:index, :new, :create, :edit, :update, :destroy]

  devise_for :users

  # Let’s encrypt
	get '/.well-known/acme-challenge/:id' => 'readings#letsencrypt'
end
