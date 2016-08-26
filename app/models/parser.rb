require "JSON"

class Parser

  def parse(json, identifier)
    result = JSON.parse(json)
    parse_transformation(result, identifier)
  end

  def parse_transformation(result, identifier)
    parsed_json = Hash.new
    parsed_json[:ip] = result["ip"]
    parsed_json[:url] = result["url"]
    parsed_json[:requested_at] = result["requestedAt"]
    parsed_json[:responded_in] = result["respondedIn"]
    parsed_json[:referred_by] = result["referredBy"]
    parsed_json[:request_type] = result["requestType"]
    parsed_json[:user_agent] = result["userAgent"]
    parsed_json[:resolution_width] = result["resolutionWidth"]
    parsed_json[:resolution_height] = result["resolutionHeight"]
    parsed_json[:client] = identifier

    parsed_json
  end

end
