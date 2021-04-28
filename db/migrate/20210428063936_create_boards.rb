# frozen_string_literal: true

class CreateBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :boards do |t|
      t.references :game, null: false, foreign_key: true
      t.string :field, null: false, array: true
      t.integer :size, null: false
      t.integer :density, null: false

      t.timestamps
    end
  end
end
