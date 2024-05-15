class Section < ApplicationRecord
	has_many :pages
	has_many :permissions, as: :permissible
	validates :title, :location, presence: true
	

	def get_pages()
	
		self.pages.where(visible: true).order("position")

	end
end
