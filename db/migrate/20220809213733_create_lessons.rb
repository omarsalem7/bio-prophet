class CreateLessons < ActiveRecord::Migration[7.0]
  def change
    create_table :lessons do |t|
      t.references :chapter, null: false, foreign_key: true
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
