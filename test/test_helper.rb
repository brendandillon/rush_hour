ENV["RACK_ENV"] ||= "test"

require 'bundler'
Bundler.require

require File.expand_path("../../config/environment", __FILE__)
require 'minitest/autorun'
require 'minitest/pride'
require 'capybara/dsl'
require 'database_cleaner'
require 'rack/test'
require 'tilt/erb'

Capybara.app = RushHour::Server

module TestHelpers

  include Rack::Test::Methods
  def app
    RushHour::Server
  end
  def setup
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end

  def db_mock
    Client.create(identifier: "jumpstartlab", root_url: "http://jumpstartlab.com")
    Client.create(identifier: "apple", root_url: "http://apple.com")
    Client.create(identifier: "google", root_url: "http://google.com")
    PayloadRequest.fill_tables({url:"http://jumpstartlab.com/blog",requested_at:"2013-02-16 21:38:28 -0700",responded_in:37,referred_by:"http://jumpstartlab.com",request_type:"GET",user_agent:"Mozilla/5.0 (Macintosh%3B Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17",resolution_width:"1920",resolution_height:"1280",ip:"63.29.38.211",client:"jumpstartlab"})
    PayloadRequest.fill_tables({url:"http://jumpstartlab.com/blog",requested_at:"2013-02-15 21:38:28 -0700",responded_in:57,referred_by:"http://jumpstartlab.com/apply",request_type:"GET",user_agent:"Mozilla/5.0 (Macintosh%3B Intel Mac OS X 10_8_2) AppleWebKit/POST.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17",resolution_width:"1920",resolution_height:"1280",ip:"63.29.38.211",client:"jumpstartlab"})
    PayloadRequest.fill_tables({url:"http://jumpstartlab.com/blog",requested_at:"2013-02-14 21:38:28 -0700",responded_in:47,referred_by:"http://jumpstartlab.com/apply",request_type:"GET",user_agent:"Mozilla/5.0 (Macintosh%3B Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17",resolution_width:"1920",resolution_height:"1280",ip:"63.29.30.01",client:"jumpstartlab"})
    PayloadRequest.fill_tables({url:"http://apple.com/buy",requested_at:"2014-02-15 17:18:28 --0700",responded_in:105,referred_by:"http://apple.com/shop",request_type:"POST",user_agent:"Mozilla/5.0 (Macintosh%3B Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17",resolution_width:"640",resolution_height:"480",ip:"59.29.43.02",client:"apple"})
    PayloadRequest.fill_tables({url:"http://apple.com/buy",requested_at:"2014-02-17 11:18:28 --0700",responded_in:105,referred_by:"http://apple.com/shop",request_type:"POST",user_agent:"Mozilla/5.0 (Macintosh%3B Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17",resolution_width:"640",resolution_height:"480",ip:"59.29.33.02",client:"apple"})
    PayloadRequest.fill_tables({url:"http://apple.com/buy",requested_at:"2014-02-26 21:58:28 --0700",responded_in:105,referred_by:"http://apple.com/shop",request_type:"POST",user_agent:"Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0; .NET CLR 3.5.30729; .NET CLR 3.0.30729; .NET CLR 2.0.50727; Media Center PC 6.0)",resolution_width:"640",resolution_height:"480",ip:"59.29.38.02",client:"apple"})
    PayloadRequest.fill_tables({url:"http://google.com/about",requested_at:"2013-01-16 21:32:28 -0700",responded_in:90,referred_by:"http://apple.com",request_type:"GET",user_agent:"Mozilla/5.0 (Macintosh%3B Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17",resolution_width:"1920",resolution_height:"1080",ip:"59.29.32.03",client:"google"})
    PayloadRequest.fill_tables({url:"http://google.com/about",requested_at:"2013-01-16 21:32:28 -0700",responded_in:40,referred_by:"http://jumpstartlab.com/technology",request_type:"GET",user_agent:"Mozilla/4.0 (Macintosh%3B Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17",resolution_width:"1920",resolution_height:"1080",ip:"63.29.38.213",client:"google"})
    PayloadRequest.fill_tables({url:"http://google.com/about",requested_at:"2013-01-16 23:38:28 -0700",responded_in:90,referred_by:"http://apple.com",request_type:"GET",user_agent:"Mozilla/5.0 (Macintosh%3B Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17",resolution_width:"1920",resolution_height:"1080",ip:"59.29.38.23",client:"google"})
  end

end
