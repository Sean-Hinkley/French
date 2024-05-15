class Album < ApplicationRecord
	has_many :photos
	has_many :permissions, as: :permissible
	validates :title, :description, presence: true
end
