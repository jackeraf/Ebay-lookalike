class Product < ApplicationRecord
	belongs_to :user
	belongs_to :category
	has_many :ratings
	has_many :bids

end
