require 'json'

class QuotesApiController < ApplicationController
	before_action :authenticate_user

	def get_quotes_by_tag
		tag = params[:tag]
		use_tag = Tag.find_by(name: tag)

		unless use_tag.present?
			crawler = QuoteCrawler.new(tag)
			crawler.crawl
			use_tag = Tag.find_by(name: tag)
		end

		render json: quotes_json(use_tag)
	end

	private

	def quotes_json(tag)
		json_quotes = { quotes: {} }

		mapped_quotes = 
			tag.quotes.map do |quote|
				quote_hash = quote.as_json
				quote_hash.except("_id", "tag_ids", "created_at", "updated_at")
			end

		json_quotes[:quotes] = mapped_quotes

		json_quotes.to_json
	end

  def authenticate_user
    token = request.headers['Authorization']&.split(' ')&.last
    decoded_token = AuthService.decode_token(token)

    unless decoded_token
      render json: { error: 'Token inválido' }, status: :unauthorized
    end
  end
end