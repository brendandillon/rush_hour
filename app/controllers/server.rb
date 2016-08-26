module RushHour
  class Server < Sinatra::Base
    not_found do
      erb :error
    end

    post '/sources' do
      client_info = Hash.new
      client_info[:root_url] = params["rootUrl"]
      client_info[:identifier] = params["identifier"]

      if params.has_key?("rootUrl") && params.has_key?("identifier")
        if Client.create(client_info).id
          status 200
          body "Success"
        else
          status 403
          body "Identifier Already Exists"
        end
      else
        status 400
        body "Missing Parameters"
      end
    end
  end
end
