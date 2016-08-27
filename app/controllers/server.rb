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

    post '/sources/:identifier/data' do
      if Client.find_by(identifier: params[:identifier])
        if params[:payload]
          parsed_payload = Parser.new.parse(params[:payload], params[:identifier])
          if PayloadRequest.fill_tables(parsed_payload)
            status 200
            body "OK"
          else
            status 403
            body "Payload already received"
          end
        else
          status 400
          body "Bad Request"
        end
      else
        status 403
        body "Application not registered"
      end
    end

    get '/sources/:identifier' do
      if Client.find_by(identifier: params[:identifier])
        if PayloadRequest.exists?(1)
          @payloadrequest = PayloadRequest
          @requesttype = RequestType
          @client_id = Client.find_by(identifier: params[:identifier]).id
          @identifier = params[:identifier]
          status 200
          erb :client_dashboard
        else
          status 403
        end
      else
        status 403
      end
    end

    get '/sources/:identifier/urls/:relativepath' do
      if Client.find_by(identifier: params[:identifier])
        if PayloadRequest.exists?(1)
          root_url = Client.find_by(identifier: params[:identifier]).root_url
          @url = Url.find_by(address: root_url+"/"+params[:relativepath])
          @identifier = params[:identifier]
          @relativepath = params[:relativepath]
          status 200
          erb :url_dashboard
        else
          status 403
        end
      else
        status 403
      end
    end

  end
end
