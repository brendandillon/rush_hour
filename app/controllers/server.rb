module RushHour
  class Server < Sinatra::Base
    not_found do
      erb :'errors/missing_page'
    end

    post '/sources' do
      client_info = collect_client_info(params)
      check_for_client_info(client_info)
      create_client(client_info)

      status 200
      body "Success"
    end

    post '/sources/:identifier/data' do
      check_for_client(Client.find_by(identifier: params[:identifier]))
      check_payload_submitted(params)
      parsed_payload = Parser.new.parse(params[:payload], params[:identifier])
      send_payload_data(parsed_payload)

      status 200
      body "OK"
    end

    get '/sources/:identifier' do
      @client = Client.find_by(identifier: params[:identifier])
      check_for_client(@client)
      check_for_payload(@client)

      @payloadrequest = PayloadRequest
      status 200
      erb :client_dashboard
    end

    get '/sources/:identifier/urls/:relativepath' do
      @client = Client.find_by(identifier: params[:identifier])
      check_for_client(@client)

      @url = Url.find_by(address: @client.root_url+"/"+params[:relativepath])
      check_for_url(@url)

      @relativepath = params[:relativepath]
      status 200
      erb :url_dashboard
    end

    def check_for_client(client)
      unless client
        status 403
        halt erb :'errors/client_not_found'
      end
    end

    def check_for_payload(client)
      unless PayloadRequest.exists?(client_id: client.id)
        status 403
        halt erb :'errors/no_data_for_client'
      end
    end

    def check_for_url(url)
      unless url
        status 403
        halt erb :'errors/no_data_for_url'
      end
    end

    def collect_client_info(params)
      { root_url: params["rootUrl"],
        identifier: params["identifier"] }
    end

    def check_for_client_info(info)
      if info.has_value?(nil)
        status 400
        halt body "Missing Parameters"
      end
    end

    def create_client(info)
      unless Client.create(info).id
        status 403
        halt body "Identifier Already Exists"
      end
    end

    def check_payload_submitted(params)
      unless params[:payload]
        status 400
        halt body "Bad Request"
      end
    end

    def send_payload_data(data)
      unless PayloadRequest.fill_tables(data)
        status 403
        halt body "Payload already received"
      end
    end
  end

end
