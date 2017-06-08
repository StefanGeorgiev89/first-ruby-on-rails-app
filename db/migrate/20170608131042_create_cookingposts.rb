class CreateCookingposts < ActiveRecord::Migration[5.0]
  def change
    create_table :cookingposts do |t|
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :cookingposts, [:user_id, :created_at]
  end
end
