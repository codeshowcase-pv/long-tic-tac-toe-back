# frozen_string_literal: true

module Boards
  class Create
    include Interactor

    def call
      context.board_params[:game] ||= context.game

      board = context.board = Board.create(context.board_params)

      return if board.save

      context.fail!(err_text: error_messages_of(board), err_code: :unprocessable_entity)
    end

    def rollback
      context.board.destroy!
    end
  end
end
