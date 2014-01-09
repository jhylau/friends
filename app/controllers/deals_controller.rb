class DealsController < ApplicationController
	def index
		client = TwitterIntegration.streaming_client
	end
end