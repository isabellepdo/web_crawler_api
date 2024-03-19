class AuthService
	# Generate token for a random 'user'
	def self.generate_token()
		JWT.encode({ user_id: rand(1..10) }, Rails.application.secrets.secret_key_base)
	end

	def self.decode_token(token)
		JWT.decode(token, Rails.application.secrets.secret_key_base).first
	rescue JWT::DecodeError
		nil
	end
end