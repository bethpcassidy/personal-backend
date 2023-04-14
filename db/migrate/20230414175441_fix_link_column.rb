class FixLinkColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :links, :postid, :post_id
  end
end
