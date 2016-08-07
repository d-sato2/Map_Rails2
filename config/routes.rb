Rails.application.routes.draw do
  devise_for :admin_users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
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

  get 'hokkaido/dl_jiti_info' => 'hokkaido#dl_jiti_info'
  get 'hokkaido/dl_update_info' => 'hokkaido#dl_update_info'
  get 'hokkaido/dl_contact_info' => 'hokkaido#dl_contact_info'
  get 'hokkaido/dl_selection_info' => 'hokkaido#dl_selection_info'
  get 'hokkaido/dl_service_info' => 'hokkaido#dl_service_info'

  get 'hokkaido/move_edit' => 'hokkaido#move_edit'
  post 'hokkaido/move_edit' => 'hokkaido#move_edit'

  get 'hokkaido/:id/edit.js.erb' => 'hokkaido#edit'

  get 'hokkaido/dl' => 'hokkaido#dl'
  get 'hokkaido/cluster' => 'hokkaido#cluster'
end
