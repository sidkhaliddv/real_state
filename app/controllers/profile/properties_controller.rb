module Profile
	class PropertiesController < BaseController
		def change_status
			byebug
		end

		def permitted_params
			params.require(:property).permit(:address, :size, :price, :status)
		end

		def resources
			@resources ||= current_user.properties
		end

		def new_resource
			@new_resource ||= current_user.properties.build(permitted_params)
		end

		def resource
			@resource ||= current_user.properties.find(params[:id])
		end

		def model
			Property
		end
	end
end
