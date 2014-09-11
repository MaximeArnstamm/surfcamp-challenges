class CreatePosts < ActiveRecord::Migration
  def change
    # TODO: your code here to create the posts table
    create_table :posts do |t|
      t.text :name
      t.text :source_url
      t.datetime :created_at
    end
  end
end
