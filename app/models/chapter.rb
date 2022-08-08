class Chapter < ApplicationRecord
    belongs_to :user
    has_and_belongs_to_many :lessons, dependent: :destroy
end
