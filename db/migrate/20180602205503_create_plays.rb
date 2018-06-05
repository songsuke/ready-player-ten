class CreatePlays < ActiveRecord::Migration[5.2]
  def change
    create_table :plays do |t|

      t.integer :timer, null: false
      t.timestamps
    end
  end
end
