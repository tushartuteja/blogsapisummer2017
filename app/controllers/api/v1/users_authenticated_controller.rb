module Api
	module V1
		class UsersAuthenticatedController < ApiController
	before_action :authenticate_user
	def authenticate_user
		access_token = params["access_token"]
		@current_user = User.find_by_access_token(access_token)
		unless @current_user
			return response_data nil, "Please Login", 200
		end

		if @current_user.disabled
			return response_data nil, "You are disabled", 200, disabled: true
		end

		update =  params["version"].to_i < 10
		if update
			return response_data nil, "Please Update", 200, update: true
		end
		

	end

	def users
		data = User.all
		return response_data data, "List of all the Users", 200
	end


	def current_user
		@current_user
	end

	def logout
		current_user.logout
		return response_data nil, "You are logged out", 200
		# data = {}
		# data["message"] = "You are logged out"
		# render json: data
	end


end

	end
end

