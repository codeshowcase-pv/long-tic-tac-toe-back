# frozen_string_literal: true

class GamesController < ApplicationController
  before_action :set_game, only: :show

  def create
    context = Games::New.call(
      players:      User.where(id: [current_user.id, params[:opponent_id]]),
      game_params:  { author: current_user },
      board_params: permit_params(:size, :density)
    )

    if context.success?
      render json: GameSerializer.render(context.game)
    else
      render_context_error(context)
    end
  end

  def show
    render json: GameSerializer.render(@game, view: :base)
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end
end
