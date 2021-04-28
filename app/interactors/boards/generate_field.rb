# frozen_string_literal: true

module Boards
  class GenerateField
    include Interactor

    def call
      size     = context.board_params[:size]
      density  = context.board_params[:density]
      one_line = Array.new(size) { '' }

      field =
        context.field =
          context.board_params[:field] =
            Array.new(size) { one_line.dup }

      number_of_disabled_cells = (size**2 * (1 - density / 100.0)).round
      indexes                  = Array.new(size**2) { |i| i }
      indexes_to_disable       = indexes.sample(number_of_disabled_cells)

      indexes_to_disable.each do |idx|
        field[idx / size][idx % size] = nil
      end
    end
  end
end
