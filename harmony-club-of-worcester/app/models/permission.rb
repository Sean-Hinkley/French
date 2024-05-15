class Permission < ApplicationRecord
    belongs_to :permissible, polymorphic: true, optional: true
	belongs_to :role
    has_many :permissions, as: :permissible
    validates :role_id, :permissible_type, presence: true
    if !:allRecords
        validates :permissible_id, presence: true
    end
end
