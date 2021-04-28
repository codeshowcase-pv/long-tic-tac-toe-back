# frozen_string_literal: true

class Game < ApplicationRecord
  enum status: {
    ongoing: 1,
    ended:   2
  }

  belongs_to :author, class_name: 'User'
  belongs_to :winner, class_name: 'User', optional: true

  has_many :plays, dependent: :destroy
  has_many :players, through: :plays
  has_one :board, dependent: :destroy

  before_validation :set_turns_order, on: :create

  validates :status, :turns_order, presence: true
  validates :current_turn_index, presence: true, format: { with: /\A\d+\z/, message: 'only allows numbers' }
  validates :winner_id, presence: true, if: -> { ended? }
  validates :winner_id, absence: true, unless: -> { ended? }

  private

  def set_turns_order
    shuffled_ids     = player_ids.shuffle
    self.turns_order = {
      '1': shuffled_ids[0],
      '2': shuffled_ids[1]
    }
  end
end
