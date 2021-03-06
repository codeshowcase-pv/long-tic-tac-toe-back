# frozen_string_literal: true

class ApplicationController < ActionController::API
  include JWTSessions::RailsAuthorization
  include ErrorRenderers

  before_action :authorize_by_access_header!

  rescue_from JWTSessions::Errors::Unauthorized, with: :not_authorized
  rescue_from JWTSessions::Errors::Expired, with: :access_token_expired

  private

  def current_user
    @current_user ||= User.find(payload['user_id'])
  end
end
