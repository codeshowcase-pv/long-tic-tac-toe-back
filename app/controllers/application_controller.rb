# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ActionController::Cookies
  include ActionController::RequestForgeryProtection

  protect_from_forgery with: :exception

  before_action :set_csrf_cookie, :authenticate_user

  private

  def set_csrf_cookie
    cookies['CSRF-TOKEN'] = form_authenticity_token
  end

  def authenticate_user
    render_error('Эээээ брат, сначала залогинься да', :forbidden) if session[:user_id].blank?
  end

  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  def render_error(text, status)
    render json: { error: text }, status: status
  end
end
