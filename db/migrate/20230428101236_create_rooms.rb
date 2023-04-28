# frozen_string_literal: true

class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :code
      t.string :name
      t.boolean :multiple, default: false, null: false
      t.integer :no_of_group

      t.timestamps
    end
  end
end
