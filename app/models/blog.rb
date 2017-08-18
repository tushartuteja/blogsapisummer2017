class Blog < ActiveRecord::Base
	belongs_to :user


	def as_json options = nil
		BlogSerializer.new(self).as_json
	end

end
