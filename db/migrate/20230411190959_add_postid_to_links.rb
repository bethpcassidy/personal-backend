class AddPostidToLinks < ActiveRecord::Migration[7.0]
  def change
    add_column :links, :postid, :integer
  end
end
