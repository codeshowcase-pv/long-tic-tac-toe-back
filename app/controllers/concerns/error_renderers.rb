# frozen_string_literal: true

module ErrorRenderers
  def not_authorized
    render_error(I18n.t('errors.common.not_authorized'), :unauthorized)
  end

  def access_token_expired
    render json: { code: 'access_token_expired' }, status: :unauthorized
  end

  def render_error(text, status)
    render json: { text: text }, status: status
  end
end
