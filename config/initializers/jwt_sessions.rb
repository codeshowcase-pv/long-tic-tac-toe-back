# frozen_string_literal: true

JWTSessions.token_store    = :redis, { redis_url: ENV['REDIS_URL'], token_prefix: 'jwt_' }
JWTSessions.encryption_key = Rails.application.secret_key_base
