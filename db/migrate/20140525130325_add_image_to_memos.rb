class AddImageToMemos < ActiveRecord::Migration
  def change
    add_column :memos, :image, :string
  end
end
