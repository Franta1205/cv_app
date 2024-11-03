Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }, skip: [:registrations, :sessions]

  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  root "cv#home"
  resources :cv do
    collection do
      get :edit_your_cv
    end
  end

  resources :docs
end
