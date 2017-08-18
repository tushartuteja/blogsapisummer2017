class BlogSerializer < ActiveModel::Serializer
	attributes :title, :content, :user


	def user
		return object.user if object.user
		return {
			phone_number: "Anonymous"
		}
		
	end

end
