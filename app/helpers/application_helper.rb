module ApplicationHelper
	def category
		@master_categories = Master::Category.all
	end

	def category_return(category_id)
		category = Master::Category.find(category_id)
		return category
	end
end
