class PayloadRequest < ActiveRecord::Base
  validates :requested_at, presence: true
  validates :responded_in, presence: true
  validates :url_id, presence: true
  validates :referred_by_id, presence: true
  validates :request_type_id, presence: true
  validates :os_and_browser_id, presence: true
  validates :resolution_id, presence: true
  validates :ip_id, presence: true
  validates :client_id, presence: true

  belongs_to :url
  belongs_to :os_and_browser
  belongs_to :resolution
  belongs_to :request_type
  belongs_to :referred_by
  belongs_to :ip
  belongs_to :client

  def self.avg_response_all
    PayloadRequest.average(:responded_in).to_f.round(2)
  end

  def self.max_response_all
    PayloadRequest.maximum(:responded_in)
  end

  def self.min_response_all
    PayloadRequest.minimum(:responded_in)
  end

  def self.all_urls_most_to_least_requested
    PayloadRequest.joins(:url).group(:address).order("count_id desc").count("id").keys.join(", ")
  end

  def self.most_frequent_request_type
    PayloadRequest.joins(:request_type).group(:verb).count.max_by { |key, value| value }.first
  end

  def self.list_all_verbs
    PayloadRequest.joins(:request_type).pluck(:verb)
  end

  def self.fill_tables(data)
    user_agent = UserAgent.parse(data[:user_agent])
    ip = IP.find_or_create_by(address: data[:ip]).id
    referred_by = ReferredBy.find_or_create_by(address: data[:referred_by]).id
    url = Url.find_or_create_by(address: data[:url]).id
    request_type = RequestType.find_or_create_by(verb: data[:request_type]).id
    resolution = Resolution.find_or_create_by(resolution_width: data[:resolution_width],resolution_height: data[:resolution_height]).id
    os_and_browser = OsAndBrowser.find_or_create_by(operating_system: user_agent.platform,browser: user_agent.browser).id
    client = Client.find_by(identifier: data[:client]).id
    assign_to_payloadrequest(user_agent, ip, referred_by,url,request_type, resolution,os_and_browser, client, data)
  end

  def self.assign_to_payloadrequest(user_agent, ip, referred_by,url,request_type, resolution,os_and_browser, client, data)
    payloadrequest ={
      ip_id: ip,
      referred_by_id: referred_by,
      url_id: url,
      request_type_id: request_type,
      resolution_id: resolution,
      requested_at: data[:requested_at],
      responded_in: data[:responded_in],
      os_and_browser_id: os_and_browser,
      client_id: client}

      payload_request_checker(payloadrequest)
  end

  def self.payload_request_checker(payloadrequest)
    if PayloadRequest.find_by(payloadrequest)
      return nil
    else
      PayloadRequest.create(payloadrequest)
    end
  end

  def self.browser_use_across_requests
    PayloadRequest.joins(:os_and_browser).group(:browser).count
  end

  def self.operating_system_use_across_requests
    PayloadRequest.joins(:os_and_browser).group(:operating_system).count
  end

  def self.resolution_across_requests
    PayloadRequest.joins(:resolution).group(:resolution_width, :resolution_height).count
  end

end
