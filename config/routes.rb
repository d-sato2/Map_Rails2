Rails.application.routes.draw do
  resources :hokkaido, only: [:edit, :update, :index]
  resources :hcontact
  resources :hokkaido, only: [:edit, :update, :index]
  resources :japan, only: [:edit, :update, :index]
  root 'hokkaido#index'

  get 'hokkaido/hokkaido_map'
  get 'hokkaido/hokkaido_value'
  get 'hokkaido/hokkaido_only'
  get 'japan/japan_map'
  get 'japan/japan_value'

  get 'hokkaido/version' => 'hokkaido#version'

  post 'hokkaido/update' => 'hokkaido#update'
  patch 'hokkaido/update' => 'hokkaido#update'

  get 'hokkaido/info' => 'hokkaido#info'
  post 'hokkaido/info' => 'hokkaido#info'

  get 'hokkaido/show/:id' => 'hokkaido#show'
  get 'hokkaido/move_show' => 'hokkaido#move_show'
  post 'hokkaido/move_show' => 'hokkaido#move_show'

  get 'hokkaido/csv' => 'hokkaido#csv'
  get 'hokkaido/csv_version' => 'hokkaido#csv_version'
  get 'hokkaido/json' => 'hokkaido#json'

  get 'hokkaido/move_edit' => 'hokkaido#move_edit'
  post 'hokkaido/move_edit' => 'hokkaido#move_edit'

  get 'hokkaido/:id/edit.js.erb' => 'hokkaido#edit'
end
