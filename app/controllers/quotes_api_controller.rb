class QuotesApiController < ApplicationController
	# before_action :authenticate_user

	def get_quotes_by_tag
		tag = params[:tag]
		byebug
		use_tag = Tag.find_by(name: tag)

		if use_tag.present?
			quotes = use_tag.quotes
		else
			crawler = QuoteCrawler.new(tag)
			quotes = crawler.crawl
		end

		render json: quotes
	end

	private

  def authenticate_user
    token = request.headers['Authorization']&.split(' ')&.last
    decoded_token = AuthService.decode_token(token)

    unless decoded_token
      render json: { error: 'Token inválido' }, status: :unauthorized
    end
  end
end