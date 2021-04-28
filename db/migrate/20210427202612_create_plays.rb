# frozen_string_literal: true

class CreatePlays < ActiveRecord::Migration[6.1]
  def change
    create_table :plays do |t|
      t.references :player, null: false, foreign_key: { to_table: :users }
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
