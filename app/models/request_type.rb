class RequestType < ActiveRecord::Base
  validates :verb, presence: true
  has_many :payload_requests
  validates :verb, uniqueness: true
  
end
