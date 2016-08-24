class RequestType < ActiveRecord::Base

  has_many :payload_requests
  validates :verb, uniqueness: true

  def self.most_frequent_type
    RequestType.group(:request_type).count.max_by { |key, value| value }.first
  end

end
