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

    quotes = doc.css('.quote').map do |quote_node|
      {
        text: quote_node.css('.text').text.strip,
        author: quote_node.css('.author').text.strip
      }
    end

    quotes.each { |quote| puts "#{quote[:text]} - #{quote[:author]}" }
  end
end
