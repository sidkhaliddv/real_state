class Property < ApplicationRecord
	belongs_to :user
	has_many_attached :images, dependent: :destroy

	validates :address, :size, :price, presence: true

	enum :status, { na: 0, sale: 1 }
end
