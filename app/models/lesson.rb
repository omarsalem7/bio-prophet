class Lesson < ApplicationRecord
  has_rich_text :content
  belongs_to :chapter
end
