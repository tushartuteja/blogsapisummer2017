class UserSerializer < ActiveModel::Serializer
	attributes :phone_number, :random


	def random
		SecureRandom.hex
	end
	
end

