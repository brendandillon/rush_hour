class Resolution < ActiveRecord::Base

  has_many :payload_requests
  validates :resolution_width, uniqueness: {scope: :resolution_height}

end
