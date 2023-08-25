class Property < ApplicationRecord
	belongs_to :user
	has_many :images, dependent: :destroy

	validates :address, :size, :price, presence: true
end
