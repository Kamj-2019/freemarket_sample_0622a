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

  resources :transactions, only: [:index, :update, :show, :new] do
    member do
      post 'pay' #購入
      get 'done' #購入後
    end
  end
  resources :users, only: [:index, :show, :edit, :update] do
    collection do
      get 'logout'
    end
    member do
      get 'profile' # プロフィール
      get 'card' # 支払い方法
    end
  end
  resources :signup do
    collection do
      get 'selection' # 分岐
      get 'personal' # 会員情報を入力
      get 'phone' # 電話番号認証
      get 'address' # 住所入力
      get 'card' # 支払い方法
      get 'done' # 完了画面
      post 'pay', to: 'signup#pay'
    end
  end
  resources :cards, only: [:new, :show] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end
end
