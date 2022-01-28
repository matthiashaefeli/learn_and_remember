class CreateSkills < ActiveRecord::Migration[7.0]
  def change
    create_table :skills do |t|
      t.string :title
      t.string :language
      t.integer :user_id
      t.boolean :public
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
