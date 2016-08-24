class RequestType < ActiveRecord::Base
  validates :verb, presence: true
  has_many :payload_requests

  def self.most_frequent_type
    RequestType.group(:request_type).count.max_by { |key, value| value }.first
  end

end
