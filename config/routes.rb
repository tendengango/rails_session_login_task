Rails.application.routes.draw do
  root 'tasks#index'
  resources :tasks #, only: [:new, :create, :show] #ajouter la methode index pour afficher tous les tasks
  resources :users #, only: [:new, :create, :show, :edit, :update]
  resources :sessions, only: [:new, :create, :destroy]
end

