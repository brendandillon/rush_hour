class PayloadRequest < ActiveRecord::Base
  validates :requested_at, presence: true
  validates :responded_in, presence: true

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
