class Blog < ActiveRecord::Base
	belongs_to :user


	def as_json options
		result =  {
			content: self.content,
			title: self.title,
			
		}

		if self.user
			result["user"] = self.user
		else
			result["user"] = {phone_number: "Anonymous"}
		end
		return result
	end

end
