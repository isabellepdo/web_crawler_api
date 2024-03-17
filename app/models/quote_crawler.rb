require 'nokogiri'
require 'open-uri'

class QuoteCrawler
	def initialize(tag)
		@tag = tag
		@base_url = 'http://quotes.toscrape.com/tag/'
	end

	def crawl
		url = "#{@base_url}#{@tag}/"
		doc = Nokogiri::HTML(URI.open(url))

		doc.css('.quote').each do |quote_node|
			quote_text = quote_node.css('.text').text.strip
			author_name = quote_node.css('.author').text.strip
			author_about_link = quote_node.at_css('span > a')['href']

			quote = Quote.find_or_initialize_by(quote: quote_text, author: author_name, author_about: author_about_link)

			if quote.new_record? 
				quote.save

				tag = Tag.find_or_create_by(name: @tag)
				quote.tags << tag
			end
		end
	end
end
