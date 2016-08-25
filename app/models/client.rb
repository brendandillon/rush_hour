class Client < ActiveRecord::Base
  has_many :payload_requests
  validates :root_url, presence: true, uniqueness: {scope: :identifier}
  validates :identifier, presence: true

end
