class CreateLanguages < ActiveRecord::Migration[7.0]
  def change
    create_table :languages do |t|
      t.string :label, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
