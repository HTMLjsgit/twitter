class CommentAddColumnPostId < ActiveRecord::Migration[5.1]
  def change
  	add_column :comments, :post_id, :integer, null: false, default: 0
  end
end
