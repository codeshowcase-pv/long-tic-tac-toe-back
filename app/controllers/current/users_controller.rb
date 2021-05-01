# frozen_string_literal: true

module Current
  class UsersController < ApplicationController
    def show
      render json: { message: Time.current }
    end
  end
end
