require 'pry'
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

  def self.average_response(id)
    Url.find(id).payload_requests.average(:responded_in).to_f
  end

  def self.http_verbs(id)
   Url.find(id).payload_requests.joins(:request_type).pluck(:verb).uniq
  end

  def self.top_three_referrers(id)
      Url.find(id).payload_requests.joins(:referred_by).group(:address).
      order("count_id desc").limit(3).count("id").keys
  end

  def self.top_three_user_agents(id)
      var = Url.find(id).payload_requests.group(:os_and_browser).
      order("count_id desc").limit(3).count("id").keys
      var.map do |os_and_browser|
        "OS: #{os_and_browser.operating_system} || Browser: #{os_and_browser.browser}"
      end
  end

end
