# frozen_string_literal: true

Rails.application.routes.draw do
  root 'static_pages#home'
  post 'events/:id/attend', as: 'attend', to: 'events#attend'
  post   'events/new', to: 'events#create'
  get    '/login',     to: 'sessions#new'
  post   '/login',     to: 'sessions#create'
  delete '/logout',    to: 'sessions#destroy'
  resources :users, only: %i[new create show]
end
