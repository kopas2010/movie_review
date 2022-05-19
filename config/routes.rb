Rails.application.routes.draw do

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
end

# ユーザー
scope module: :user do
  root :to => "homes#top"
  get "reviews/index" => "reviews/index"
  resources :movies, only: [:new, :index, :show, :edit, :create, :update, :destroy] do
    resources :reviews, only: [:create]
  end
  resources :reviews, only: [:show, :edit, :update, :destroy] do
    resources :comments, only: [:create]
  end
  resources :comments, only: [:edit, :update, :destroy]

  resources :users, only: [:index, :show, :edit, :update]
  #退会機能
  get '/users/:id/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
  patch '/users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'
end
end