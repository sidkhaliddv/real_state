class Property < ApplicationRecord
	belongs_to :user

	validates :address, :size, :price, presence: true
end
