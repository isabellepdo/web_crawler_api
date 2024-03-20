class ApplicationController < ActionController::API
  def authenticate_user
		token = request.headers['Authorization']&.split(' ')&.last
		decoded_token = AuthService.decode_token(token)

		unless decoded_token
			render json: { error: 'Token inválido' }, status: :unauthorized
		end
	end
end
