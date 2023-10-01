class BaseController < ApplicationController
	def index
		@resources = resources
	end

	def new
		@resource = model.new
	end

  def create
		if new_resource.save
			redirect_to new_resource
		else
			render :new, status: :unprocessable_entity
		end
	end

	def edit
		resource
	end

	def update
		if resource.update(permitted_params)
			byebug
			respond_to do |format|
				format.html { redirect_to resource }
				format.turbo_stream
			end
		else
			render :edit, status: :unprocessable_entity
		end
	end

	def show
		@resource = resource
	end

	def destroy
		resource.destroy

		respond_to do |format|
			format.turbo_stream
			format.html { redirect_to request.referrer }
		end
	end
end
