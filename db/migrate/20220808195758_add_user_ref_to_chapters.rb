class AddUserRefToChapters < ActiveRecord::Migration[7.0]
  def change
    add_reference :chapters, :user, null: false, foreign_key: true
  end
end
