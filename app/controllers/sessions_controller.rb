class SessionsController < ApplicationController
	def create
		token = AuthService.generate_token()
		render json: { token: token }
	end
end