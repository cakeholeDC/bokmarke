class Author < ApplicationRecord
	has_many :books

	def self.search(search)
		if search
			author = Author.where("name like ?", "%#{search}%")
			if author
				author
			else
				Author.all
			end
		else
			Author.all
		end
	end

	def sort_by_name
		self.sort_by {|author| author.name}
	end


end
