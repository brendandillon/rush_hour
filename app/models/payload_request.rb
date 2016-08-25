require 'pry'
class PayloadRequest < ActiveRecord::Base
  validates :requested_at, presence: true
  validates :responded_in, presence: true
  validates :url_id, presence: true
  validates :referred_by_id, presence: true
  validates :request_type_id, presence: true
  validates :user_agent_id, presence: true
  validates :resolution_id, presence: true
  validates :ip_id, presence: true

  belongs_to :url

  def self.avg_response_all
    PayloadRequest.average(:responded_in).to_f
  end

  def self.max_response_all
    PayloadRequest.maximum(:responded_in)
  end

  def self.min_response_all
    PayloadRequest.minimum(:responded_in)
  end

  def self.fill_tables(data)
    ip_from_data = IP.find_or_create_by(address: data[:ip]).id
    referred_by_from_data = ReferredBy.find_or_create_by(address: data[:referred_by]).id
    url_from_data = URL.find_or_create_by(address: data[:url]).id
    request_type_from_data = RequestType.find_or_create_by(verb: data[:request_type]).id
    resolution_from_data = Resolution.create(resolution_width: data[:resolution_width], resolution_height: data[:resolution_height]).id
    # Resolution.find(resolution_from_data).update_attribute(resolution_height, data[:resolution_height])
    PayloadRequest.create({
      ip_id: ip_from_data,
      referred_by_id: referred_by_from_data,
      url_id: url_from_data,
      request_type_id: request_type_from_data,
      resolution_id: resolution_from_data
      requested_at: data[:requested_at]
      responded_in: data[:responded_in]
      # and also the useragent thing
      })
  end
end
