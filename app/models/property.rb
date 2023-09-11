class Property < ApplicationRecord
	belongs_to :user
	has_many_attached :images, dependent: :destroy

	validates :address, :size, :price, presence: true
end
