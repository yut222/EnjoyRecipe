Rails.application.routes.draw do


  root 'homes#index'

  get 'recipes/tweet', to: 'homes#tweet_index'

  get 'users/:id/reregistration', to: 'users#reregistration', as: 'reregistration'
  patch '/users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'

  # URL /users/sign_in ...
  devise_for :users

  # guestログイン
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
