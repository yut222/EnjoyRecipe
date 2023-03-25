Rails.application.routes.draw do

  root 'homes#index'
  get 'recipes/tweet', to: 'homes#tweet_index'
  get 'recipes/tag/:name', to: "recipes#tag_search"
  get 'recipes/search', to: 'recipes#search'

  get 'users/:id/reregistration', to: 'users#reregistration', as: 'reregistration'
  patch '/users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'

  # URL /users/sign_in ...devise
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }

  # guestログイン
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  # ユーザー フォロー、フォロワー、お気に入り、材料、退会
  resources :users
  resources :users do
    member do
      get :following, :followers, :favorites, :inventories, :unsubscribe
    end
  end

  # 中間関係
  resources :relationships, only: [:create, :destroy]

  # レシピ コメント、お気に入り
  resources :recipes
  resources :recipes do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  # 在庫
  resources :inventories, only: [:show, :new, :create, :edit, :update, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
