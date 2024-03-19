Rails.application.routes.draw do
	# Route for token creation
	get '/get_token', to: 'sessions#create'
	# Route to get_quotes_by_tag method in Quotes_api
	get '/api/quotes/:tag', to: 'quotes_api#get_quotes_by_tag'
end
