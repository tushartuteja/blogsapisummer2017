module Api
	module V2
		class BlogsController < UsersAuthenticatedController
	before_action :authenticate_user
	def index
		data = {}
		data["blogs"] = Blog.all
		return response_data data, "List of blogs", 200
	end

	def create
		title = params["title"]
		content = params["content"]
		blog = Blog.create title: title, content: content
		# render json: blog
		return response_data blog, "Blog Created Successfully",200
	end


		end
	end
end

