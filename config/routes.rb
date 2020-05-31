Rails.application.routes.draw do
  root 'tweets#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :tweets do
    member do
      put "like", to: "tweets#like"
      put "dislike", to: "tweets#dislike"
    end
  end
  resources :users do
    get 'profile'
  end
  
end