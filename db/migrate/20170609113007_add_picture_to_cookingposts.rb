class AddPictureToCookingposts < ActiveRecord::Migration[5.0]
  def change
    add_column :cookingposts, :picture, :string
  end
end
