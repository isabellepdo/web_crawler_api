class QuotesApiController < ApplicationController
	def get_quotes_by_tag
		tag = params[:tag]
		use_tag = Tag.find_by(name: tag)

		if use_tag.present?
			quotes = use_tag.quotes
		else
			crawler = QuoteCrawler.new(tag)
			quotes = crawler.crawl
		end

		render json: quotes
	end
end