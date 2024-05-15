class Page < ApplicationRecord
	belongs_to :section
	has_many :permissions, as: :permissible
	validates :title, presence: true
	
	#maybe?
	has_one_attached :doc
	#closing maybe?
	extend FriendlyId
  	friendly_id :permalink, use: :slugged
	  #prehaps make this default to the title?
end
