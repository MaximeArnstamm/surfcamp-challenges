class ModifyPosts < ActiveRecord::Migration
  def change
    # TODO: your code here to create the posts table
    add_column :posts, :rating, :integer
  end
end
