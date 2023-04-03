class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.text :content
      t.integer :reciver_id
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
