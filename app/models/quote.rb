class Quote
  include Mongoid::Document
  include Mongoid::Timestamps
  field :quote, type: String
  field :author, type: String
  field :author_about, type: String
  has_and_belongs_to_many :tags
end
