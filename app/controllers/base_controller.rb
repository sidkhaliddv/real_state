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
			redirect_to resource
		else
			render :edit, status: :unprocessable_entity
		end
	end

	def show
		@resource = resource
	end

	def destroy
		resource.destroy
		
		redirect_to request.referrer
	end
end
