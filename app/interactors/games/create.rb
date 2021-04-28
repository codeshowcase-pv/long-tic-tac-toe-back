# frozen_string_literal: true

module Games
  class Create
    include Interactor

    def call
      game         = context.game = Game.new(context.game_params)
      game.players = context.players

      return if game.save

      context.fail!(err_text: error_messages_of(game), err_code: :unprocessable_entity)
    end

    def rollback
      context.game.destroy!
    end
  end
end
