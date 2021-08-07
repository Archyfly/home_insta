Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#index'

  resources :users do#, only: [:index, :show, :edit, :update]
    resources :posts
  end

end
