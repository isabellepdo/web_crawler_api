class SessionsController < ApplicationController
	def create
		user = User.find_by(email: params[:email])

		if user && user.authenticate(params[:password])
			token = AuthService.generate_token(user.id)
			render json: { token: token }
		else
			render json: { error: 'Credenciais inválidas' }, status: :unauthorized
		end
	end
end