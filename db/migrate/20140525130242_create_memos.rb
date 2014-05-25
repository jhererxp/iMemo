class CreateMemos < ActiveRecord::Migration
  def change
    create_table :memos do |t|
      t.string :title
      t.string :subject
      t.text :content
      t.date :created
      t.date :due

      t.timestamps
    end
  end
end
