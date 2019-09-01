Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'items#index'

  resources :items do
    member do
      get 'category' # カテゴリー一覧表示
      get 'brand' # ブランド一覧表示
    end
  end
  resources :transactions, only: [:edit, :update]
  resources :users, only: [:index, :show, :edit, :update] do
    collection do
      get 'logout'
      get 'signup'
    end
    member do
      get 'profile' # プロフィール
      get 'card' # 支払い方法
    end
  end
end