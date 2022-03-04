class CreateUserSettings < ActiveRecord::Migration[7.0]
  def change
    create_table :user_settings do |t|
      t.integer :user_id
      t.boolean :first_month
      t.boolean :five_month
      t.boolean :year

      t.timestamps
    end
  end
end
