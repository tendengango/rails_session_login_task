Rails.application.routes.draw do
  root 'tasks#index'
  resources :tasks #, only: [:new, :create, :show] #ajouter la methode index pour afficher tous les tasks
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  #get 'user_tasks/:user_id' => 'tasks#user', as: :user_tasks
end

