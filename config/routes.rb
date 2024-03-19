Rails.application.routes.draw do
	# Rota para criação de token
	get '/get_token', to: 'sessions#create'
	# Rota para o método get_quotes_by_tag em Quotes_api
	get '/api/quotes/:tag', to: 'quotes_api#get_quotes_by_tag'
end
