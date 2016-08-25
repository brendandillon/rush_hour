class Url < ActiveRecord::Base

  validates :address, presence: true
  has_many :payload_requests
  validates :address, uniqueness: true

  def self.max_response(id)
    Url.find(id).payload_requests.maximum(:responded_in)
  end

end
