class AddSponsoredPostsToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :sponsored_post_id, :string
    add_column :comments, :integer, :string
    add_index :comments, :integer
  end
end
