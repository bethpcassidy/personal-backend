class CreateBios < ActiveRecord::Migration[7.0]
  def change
    create_table :bios do |t|
      t.string :name
      t.string :bodytext
      t.string :github

      t.timestamps
    end
  end
end
