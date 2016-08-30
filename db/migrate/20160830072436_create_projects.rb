class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.text :describe
      t.integer :team_id
      t.integer :todos_count

      t.timestamps
    end
  end
end
