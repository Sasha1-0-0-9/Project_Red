class CategoriesController < ApplicationController
	def index
		@products = Product.all
	end
end
