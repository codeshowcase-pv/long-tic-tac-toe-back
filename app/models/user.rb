# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :created_games,
           class_name:  'Game',
           foreign_key: :author_id,
           inverse_of:  :author,
           dependent:   :destroy

  has_many :won_games,
           class_name:  'Game',
           foreign_key: :winner_id,
           inverse_of:  :winner,
           dependent:   :destroy

  has_many :plays,
           foreign_key: :player_id,
           inverse_of:  :player,
           dependent:   :destroy

  has_many :games, through: :plays

  validates :name, :password_digest, presence: true
  validates :login, presence: true, uniqueness: true
end
