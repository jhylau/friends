class HotelsController < ApplicationController
	def index
		@hotels = []
	end

	def create
		redirect_to hotels_path
	end
end