module Profile
	class WalletsController < BaseController
		def update
			if resource.update(cash: resource.cash + params[:wallet][:cash].to_i)
				redirect_to profile_wallet_path(@resource)
			else
				render :edit, status: :unprocessable_entity
			end
		end

		def resource
			@resource ||= current_user.wallet
		end

		def permitted_params
			params.require(:wallet).permit(:cash)
		end
	end
end
