class Lesson < ApplicationRecord
    belongs_to :user
    has_and_belongs_to_many :chapters, dependent: :destroy
end
