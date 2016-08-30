class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.integer :team_id, null: false, index: true
      t.integer :project_id, index: true
      t.integer :user_id, null: false, index: true
      t.integer :target_id, null: false, index: true
      t.integer :comment_id, index: true
      t.string :action, index: true
      t.string :type

      t.timestamps
    end
  end
end
