class CreateSkills < ActiveRecord::Migration[7.0]
  def change
    create_table :skills do |t|
      t.string :title
      t.text :body
      t.integer :language_id
      t.integer :user_id
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
