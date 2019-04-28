class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.references :user, foreign_key: true
      t.references :group, foreign_key: true
      t.integer :role

      t.timestamps
    end
  end
end
