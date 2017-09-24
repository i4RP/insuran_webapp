Rails.application.routes.draw do
  root 'users#index'
  devise_for :users

  resources :insurances, only: [ :index, :update ]

  resources :users do
    resources :insurances, only: [ :show, :new, :create ]
    resources :buy_inses, only: [ :new, :create ]
    resources :expense_reports, only: [ :index, :show, :new, :create, :update ]
  end
end
