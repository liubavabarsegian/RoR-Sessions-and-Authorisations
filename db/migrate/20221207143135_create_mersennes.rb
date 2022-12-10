# frozen_string_literal: true

class CreateMersennes < ActiveRecord::Migration[7.0]
  def change
    create_table :mersennes, id: false do |t|
      t.integer :num, null: false
      t.integer :result, array: true
      t.integer :count

      t.timestamps
    end

    execute 'ALTER TABLE mersennes ADD PRIMARY KEY (num);'
    add_index :mersennes, [:num], unique: true
  end
end
