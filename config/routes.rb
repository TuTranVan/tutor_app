Rails.application.routes.draw do
  root "static_pages#home"

  get "/tutor", to: "static_pages#tutor"
  get "/student", to: "static_pages#student"
  get "/parent", to: "static_pages#parent"
  get "/about", to: "static_pages#about"

  get "/signup", to: "users#new"
  post "/signup", to: "users#create"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users, only: [:destroy, :show]
  resources :tutors, only: [:new, :create]
  resources :students, only: [:new, :create]

  namespace :admin do
    root "static_pages#index"
    resources :users, except: :show
    resources :subjects, except: :show
    resources :tutors, only: [:index, :show]
  end
end
