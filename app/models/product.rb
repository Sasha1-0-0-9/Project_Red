class Product < ApplicationRecord
	belongs_to :category
	validates :title, :price, :description, presence: true
end
