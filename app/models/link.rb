class Link < ApplicationRecord
  validates :uri, format: URI::regexp(%w[http https]), uniqueness: true
  validates_uniqueness_of :hashid
end
