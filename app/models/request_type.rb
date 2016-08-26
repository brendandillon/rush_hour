class RequestType < ActiveRecord::Base
  validates :verb, presence: true
  has_many :payload_requests
  validates :verb, uniqueness: true

  def self.most_frequent_type
  end

  #method created by Rapha
  def self.list_all_verbs
    RequestType.group(:verb).count.keys.sort.join(",")
  end

end
