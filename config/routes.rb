Rails.application.routes.draw do

  root 'homes#index'

  get 'recipes/tweet', to: 'homes#tweet_index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
