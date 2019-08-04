Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'mypage' => 'homes#mypage'
  root 'homes#index'

  get 'users/logout' => 'users#logout'


end
