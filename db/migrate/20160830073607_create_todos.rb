class CreateTodos < ActiveRecord::Migration[5.0]
  def change
    create_table :todos do |t|
      t.string :name, index: true
      t.text :describe
      t.integer :user_id, null: false, index: true
      t.integer :assigned_user_id, index: true
      t.integer :project_id, null: false, index: true
      t.integer :team_id, null: false, index: true
      t.datetime :due_date, index: true
      t.integer :status, default: 0, index: true
      t.datetime :deleted_at, index: true

      t.timestamps
    end
  end
end
