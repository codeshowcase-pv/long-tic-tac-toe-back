# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: :login
  skip_before_action :set_csrf_cookie, only: :logout

  protect_from_forgery except: :login

  def login
    user = User.find_by(login: params[:login])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      render json: { name: user.name }
    else
      render_error('Аль юзер не найден, аль пароль неверен', :unauthorized)
    end
  end

  def logout
    session.delete(:user_id)
  end
end
