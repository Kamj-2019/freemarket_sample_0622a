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
  resources :registration do
    collection do
      get 'step1' # 会員情報を入力
      get 'step2' # 電話番号認証
      get 'step3' # 住所入力
      get 'step4' # 支払い方法
      get 'done' # 完了画面
    end
  end
end
