class User < ActiveRecord::Base
	validates :phone_number, uniqueness: true

	has_many :blogs

	def generate_otp
		self.otp = rand(1000..10000)
		self.otp_expiry = Time.now + 15.seconds
		unless self.access_token
			self.access_token = SecureRandom.hex
		end

		self.save!
	end

	def as_json options = nil
		# return {
		# 	phone_number: self.phone_number,
		# 	blog_count: self.blogs.length
		# }

		UserSerializer.new(self).as_json
	end



	def send_otp
		#does nothing
	end

	def verify_otp otp
		if Time.now < self.otp_expiry
			return otp == self.otp
		else
			self.generate_otp
			self.send_otp
			return false
		end

	end


	def logout
		self.access_token = nil
		self.save
	end
	


end
