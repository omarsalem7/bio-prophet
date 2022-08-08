class AddChapterRefToLessons < ActiveRecord::Migration[7.0]
  def change
    add_reference :lessons, :chapter, null: false, foreign_key: true
  end
end
