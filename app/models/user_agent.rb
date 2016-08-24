class UserAgent < ActiveRecord::Base

  has_many :payload_requests
  validates :browser, uniqueness: {scope: :operating_system}

end
