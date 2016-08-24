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
    PayloadRequest.average(:responded_in)
  end

  def self.max_response_all
    PayloadRequest.maximum(:responded_in)
  end

  def self.min_response_all
    PayloadRequest.minimum(:responded_in)
  end
end
