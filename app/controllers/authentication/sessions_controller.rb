# frozen_string_literal: true

module Authentication
  class SessionsController < ApplicationController
    skip_before_action :authorize_by_access_header!, only: :create

    def create
      user = User.find_by(login: params[:login])

      if user&.authenticate(params[:password])
        render json: SessionGenerator.new(user).login_with_cache
      else
        render_error(I18n.t('errors.authentication.incorrect_credentials'), :unauthorized)
      end
    end

    def destroy
      session = JWTSessions::Session.new(refresh_by_access_allowed: true)
      session.login
      session.flush_by_access_payload
    end
  end
end
