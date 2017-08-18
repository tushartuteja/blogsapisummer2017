module Api
	module V1
		class BlogsController < UsersAuthenticatedController
	before_action :authenticate_user
	def index
		data = {}
		data["blogs"] = Blog.all.includes(:user)
		return response_data data, "List of blogs", 200
	end

	def create
		title = params["title"]
		content = params["content"]
		blog = Blog.create title: title, content: content, user_id: current_user.id
		# render json: blog
		return response_data blog, "Blog Created Successfully",200
	end


		end
	end
end

