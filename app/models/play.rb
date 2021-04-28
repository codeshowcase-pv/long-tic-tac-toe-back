# frozen_string_literal: true

class Play < ApplicationRecord
  belongs_to :player, class_name: 'User'
  belongs_to :game
end
