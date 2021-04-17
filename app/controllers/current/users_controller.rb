# frozen_string_literal: true

module Current
  class UsersController < ApplicationController
    def show
      render json: { message: 'Если вы читаете это, значит вы залогинились' }
    end
  end
end
