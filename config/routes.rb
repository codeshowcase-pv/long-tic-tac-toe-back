# frozen_string_literal: true

Rails.application.routes.draw do
  mount ActionCable.server => '/websocket'

  namespace :current do
    resource :user, only: :show
  end

  post   'refresh', to: 'authentication/refresh#create'
  post   'login',   to: 'authentication/sessions#create'
  delete 'logout',  to: 'authentication/sessions#destroy'
end
