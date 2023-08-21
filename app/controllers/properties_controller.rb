class PropertiesController < BaseController
	def new
		@resource = current_user.properties.new
	end

	private
		def permitted_params
			params.require(:property).permit(:address, :size, :price, :status)
		end

		def resources
			@resources ||= Property.all
		end

		def resource
			@resource ||= Property.find(params[:id])
		end

		def new_resource
			@new_resource ||= current_user.properties.build(permitted_params)
		end
end
