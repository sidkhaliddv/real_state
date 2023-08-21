class BaseController < ApplicationController
	def index
		@resources = resources
	end

	def new
		# @resource = new_resource
	end

  def create
		if new_resource.save
			redirect_to new_resource
		else
			render :new, status: :unprocessable_entity
		end
	end

	def show
		@resource = resource
	end
end
