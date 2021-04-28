# frozen_string_literal: true

class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.integer :status, null: false, default: 1
      t.jsonb :turns_order, null: false
      t.string :current_turn_index, null: false, default: '1'
      t.references :winner, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
