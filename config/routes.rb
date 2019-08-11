Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'items#index'
  resources :items, only: [:index, :new, :create, :show]
  resources :users, only: [:index, :show, :edit] do
    collection do
      get 'logout'
      get 'signup'
    end
  end
end
