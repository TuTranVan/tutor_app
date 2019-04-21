Rails.application.routes.draw do
  root "static_pages#home"

  get "/giasu", to: "static_pages#tutor"
  get "/hocsinh", to: "static_pages#student"
  get "/phuhuynh", to: "static_pages#parent"
  get "/about", to: "static_pages#about"

  get "/signup", to: "users#new"
  post "/signup", to: "users#create"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users, only: [:destroy, :show]
  resources :tutors, only: [:index, :new, :create, :show]
  resources :students, only: [:new, :create, :show]
  resources :certificates, except: [:index, :show]
  resources :majors, only: [:create, :destroy]
  resources :schedules, only: [:create, :destroy]
  resources :reports, only: [:create, :destroy] do
    member do
      get :showclass
    end
  end
  resources :posts do
    member do
      get :register
      get :approve
      get :reject
      get :finish
    end
  end

  namespace :admin do
    root "static_pages#index"
    resources :users, except: :show
    resources :subjects, except: :show
    resources :tutors, only: [:index, :show]
    resources :students, only: [:index, :show]
  end
end
