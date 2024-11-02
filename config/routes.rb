Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}
  # Defines the root path route ("/")
  # root "articles#index"
  root "cv#home"
  resources :cv do
    collection do
      get :edit_your_cv
    end
  end

  resources :docs
end
