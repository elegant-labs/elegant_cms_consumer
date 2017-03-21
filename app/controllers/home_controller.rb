class HomeController < ApplicationController
	def index

		# Block to load our feed from Elegant CMS
		begin
			#build our URI, request and headers
			elegant_uri = URI.parse(ENV['ELEGANT_URL'])
            http = Net::HTTP.new(elegant_uri.host, elegant_uri.port)
            http.read_timeout = 2
            request = Net::HTTP::Get.new(elegant_uri.request_uri)
            request["Authorization"] = 'Token token=' + ENV['ELEGANT_KEY']

            #make the request and store the response
            response = http.request(request)

            # parse it.
            @result = JSON.parse(response.body).with_indifferent_access

        rescue Exception => e
            logger.error "BarsController::get_and_process_sponsor_list: ERROR ELEGANT #{e.message}\n#{e.backtrace[0..5].join("\n")}"
        end

	end
end
