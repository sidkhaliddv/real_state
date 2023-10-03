class PropertiesController < BaseController
	def new
		@resource = current_user.properties.new
	end

	def buy
		ActiveRecord::Base.transaction do
			resource.user.wallet.increment!(:cash, resource.price)
			current_user.properties << resource
			current_user.wallet.decrement!(:cash, resource.price)
		end
	end

	private
		def permitted_params
			params.require(:property).permit(:address, :size, :price, :status)
		end

		def resources
			@resources ||= Property.where(status: 1)
		end

		def resource
			@resource ||= Property.find(params[:id])
		end

		def new_resource
			@new_resource ||= current_user.properties.build(permitted_params)
		end
end
