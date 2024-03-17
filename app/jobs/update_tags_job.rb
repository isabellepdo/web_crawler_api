class UpdateTagsJob
  include Sidekiq::Worker

  def perform
    Tag.all.each do |tag|
      crawler = QuoteCrawler.new(tag.name)
      quotes = crawler.crawl
    end
  end
end
