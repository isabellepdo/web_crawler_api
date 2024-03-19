class ApplicationController < ActionController::API
	# before_action :authenticate_request

	# private

	# def authenticate_request
	# 	token = request.headers['Authorization']&.split(' ')&.last
	# 	decoded_token = AuthService.decode_token(token)

	# 	if decoded_token && (user = User.find_by(id: decoded_token['user_id']))
	# 		@current_user = user
	# 	else
	# 		render json: { error: 'Token inválido' }, status: :unauthorized
	# 	end
	# end
end
