# frozen_string_literal: true

class AddPositionToNotes < ActiveRecord::Migration[7.0]
  def up
    add_column :notes, :position, :integer, null: false, default: 1
    add_index :notes, [:user_id, :position], unique: true, name: 'unique_user_id_position'
  end

  def down
    remove_column :notes, :position
    remove_index :notes, name: 'unique_user_id_position'
  end
end
