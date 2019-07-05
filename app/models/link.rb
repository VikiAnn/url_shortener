class Link < ApplicationRecord
  validates :uri, format: URI::regexp(%w[http https])
end
