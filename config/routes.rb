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

  resources :users, only: [:index, :show, :edit, :update] do
    collection do
      get 'logout'
    end
  end
  resources :signup do
    collection do
      get 'step0' # 分岐
      get 'step1' # 会員情報を入力
      get 'step2' # 電話番号認証
      get 'step3' # 住所入力
      get 'step4' # 支払い方法
      get 'done' # 完了画面
    end
    member do
      get 'profile' # プロフィール
      get 'card' # 支払い方法
    end
  end
end
