module Profile
	class PropertiesController < BaseController
		def change_status
			current_user.properties.find(params[:id]).update!(status: params[:status].to_i)
			render json: { message: 'Successfully updated property status' }
		end

		def permitted_params
			params.require(:property).permit(:address, :size, :price, :status, images: [])
		end

		def resources
			@resources ||= current_user.properties
		end

		def new_resource
			byebug
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
