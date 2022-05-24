Rails.application.routes.draw do

  namespace :user do
    get 'relationships/followings'
    get 'relationships/followers'
  end
  namespace :admin do
    get 'homes/top'
  end
  # ユーザー用
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }

  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  # 管理者
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
    resources :reviews, only: [:index, :show, :edit, :update, :destroy]
    resources :movies, only: [:index, :show, :edit, :update, :destroy]
    resources :comments, only: [:index, :edit, :update, :destroy]
    #退会機能
    get '/users/:id/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
    patch '/users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'

    #検索機能
    get "search" => "searches#search"

    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'

  end

  # ユーザー
  scope module: :user do
    root :to => "homes#top"
    get "reviews/index" => "reviews/index"
    resources :movies, only: [:new, :index, :show, :edit, :create, :update, :destroy] do
      resources :reviews, only: [:create]
      resource :favorites, only: [:create, :destroy]
    end
    resources :reviews, only: [:show, :edit, :update, :destroy] do
      resources :comments, only: [:create]
    end
    resources :comments, only: [:edit, :update, :destroy]

    resources :users, only: [:index, :show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end

    #退会機能
    get '/users/:id/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
    patch '/users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'

    #検索機能
    get "search" => "searches#search"

  end



end