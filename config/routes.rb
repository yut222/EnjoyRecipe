Rails.application.routes.draw do


  root 'homes#index'

  get 'recipes/tweet', to: 'homes#tweet_index'

  # URL /users/sign_in ...
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
