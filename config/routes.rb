Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#all_posts'

  resources :users do#, only: [:index, :show, :edit, :update]
    resources :posts do
      resources :comments
    end
    resources :followers, only: :index
    resources :followings, only: :index
  end

  resources :follows, only: [:create]
end
