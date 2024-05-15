class Sponsor < ApplicationRecord
    has_many :permissions, as: :permissible
    has_one_attached :image
    validates :title, presence: true
end
