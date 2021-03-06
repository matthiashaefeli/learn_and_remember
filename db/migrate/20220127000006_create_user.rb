class CreateUser < ActiveRecord::Migration[7.0]
  create_table :users do |t|
    t.string :name, null: false
    t.string :email, null: false
    t.string :password_digest, null: false
    t.boolean :verified, default: false, null: false
    t.string :verify_id, null: true

    t.timestamps
  end

  add_index :users, :email, unique: true
end
