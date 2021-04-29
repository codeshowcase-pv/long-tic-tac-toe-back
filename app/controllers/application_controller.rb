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

  def render_error(text, code)
    render json: { error: text }, status: code
  end

  def render_context_error(context)
    render_error(context.err_text, context.err_code)
  end

  def permit_params(*args)
    params.permit(*args).to_h.deep_symbolize_keys
    # hash.each_pair { |k, v| hash[k] = ActiveModel::Type::Boolean.new.cast(v) if %w[true false].include?(v) }
  end
end
