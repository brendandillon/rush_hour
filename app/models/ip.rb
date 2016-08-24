class IP < ActiveRecord::Base

  has_many :payload_requests
  validates :address, uniqueness: true

end
