class CreateAccesses < ActiveRecord::Migration[5.0]
  def change
    create_table :accesses do |t|
      t.integer :user_id, null: false, index: true
      t.integer :team_id, null: false, index: true
      t.integer :role, null: false

      t.timestamps
    end
  end
end
