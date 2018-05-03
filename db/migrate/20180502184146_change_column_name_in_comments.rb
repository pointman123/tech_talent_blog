class ChangeColumnNameInComments < ActiveRecord::Migration[5.1]
 
 	def up
 	    remove_column :comments, :blog_id, :integer
 	    add_column :comments, :blog_post_id, :integer
	end

	def down
		remove_column :comments, :blog_post_id, :integer
		add_column :comments, :blog_id, :integer
	end
end