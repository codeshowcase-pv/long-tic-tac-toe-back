# frozen_string_literal: true

class Board < ApplicationRecord
  belongs_to :game

  validates :field, :size, :density, presence: true
end
