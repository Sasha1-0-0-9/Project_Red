class Category < ApplicationRecord
  has_many :products
  has_ancestry #-> enables the "ancestry" gem
  #
  validates :title, presence: true

  def to_param
    "#{id}-#{title.gsub(/[^a-z0-9]+/i, '-')}"
  end
end
