# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :current do
    resource :user, only: :show
  end

  post 'login', to: 'sessions#login'
  delete 'logout', to: 'sessions#logout'
end
