class Url < ActiveRecord::Base

  validates :address, presence: true
  has_many :payload_requests
  validates :address, uniqueness: true

  def self.max_response(id)
    Url.find(id).payload_requests.maximum(:responded_in)
  end

  def self.min_response(id)
    Url.find(id).payload_requests.minimum(:responded_in)
  end

  def self.response_time_list(id)
    Url.find(id).payload_requests.order(:responded_in).pluck(:responded_in)
  end


end
