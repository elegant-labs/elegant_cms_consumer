class HomeController < ApplicationController

	# GET /index
	# Action to load our feed from Elegant CMS and display it
	def index
		@result = load_elegant_data

		respond_to do |format|
            format.html { render }
            format.json { render :json => @result, :status => :ok }
        end

	rescue Exception => e
		logger.error "HomeController::index: ERROR #{e.message}\n#{e.backtrace[0..5].join("\n")}"
	end

private

	def load_elegant_data
		#build our URI, request and headers
		elegant_uri = URI.parse(ENV['ELEGANT_CMS_URL'])
		http = Net::HTTP.new(elegant_uri.host, elegant_uri.port)
		http.read_timeout = 2
		request = Net::HTTP::Get.new(elegant_uri.request_uri)
		request["Authorization"] = 'Token token=' + (ENV['ELEGANT_CMS_TOKEN'])

		#make the request and store the response
		response = http.request(request)

		#This will be a JSON encoded string, so lets parse it into a hash.
		return JSON.parse(response.body).with_indifferent_access
	rescue Exception => e
    	logger.error "HomeController::load_elegant_data: ERROR ELEGANT #{e.message}\n#{e.backtrace[0..5].join("\n")}"
	end
end
