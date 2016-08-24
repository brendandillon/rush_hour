class UserAgent < ActiveRecord::Base
  validates :browser, presence: true
  validates :os, presence: true
  has_many :payload_requests
  validates :browser, uniqueness: {scope: :operating_system}

end
