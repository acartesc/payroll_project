Rails.application.routes.draw do
  resources :clients do
    resources :companies
  end

  resources :companies do
    resources :workers
  end

  root to: "clients#index"
  resources :workers
  #VER qué se necesita mostrar de workers para hacer only
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
