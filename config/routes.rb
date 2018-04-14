Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :clients do
    resources :companies
  end

  resources :companies, except: [:new, :create, :index] do
    resources :workers
  end

  root to: "clients#index"

  resources :workers, except: [:new, :create, :index] do
    resources :family_burdens
  end

  resources :workers do
    resources :remunerations
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
