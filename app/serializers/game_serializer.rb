# frozen_string_literal: true

class GameSerializer < Blueprinter::Base
  identifier :id

  view :base do
    field(:field) { |game| game.board.field }
  end
end
