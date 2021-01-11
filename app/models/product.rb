class Product < ApplicationRecord
	validates :title, :price, :description, presence: true
end
