Rails.application.routes.draw do

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
end

# ユーザー
scope module: :user do
  root :to => "homes#top"
  resources :movies, only: [:new, :index, :show, :edit, :create, :update, :destroy]
  resources :reviews, only: [:new, :index, :show, :edit, :create, :update]
  resources :reviewers, only: [:new, :index, :show, :edit]
  resources :post_images, only: [:new, :index, :show]
end
end