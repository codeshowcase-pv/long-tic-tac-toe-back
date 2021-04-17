# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :current do
    resource :user, only: :show
  end

  get 'login',     to: 'sessions#login'
  delete 'logout', to: 'sessions#logout'
end
