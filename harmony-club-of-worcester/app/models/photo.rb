class Photo < ApplicationRecord
	belongs_to :album
	has_one_attached :image
	has_many :permissions, as: :permissible
	# validates :image, presence: true
end
