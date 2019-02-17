class ListingsController < ApplicationController
	before_action :authenticate_user!

	def index
		@listings = current_user.listings
	end

	def show
		@listing = current_user.listings.find(params[:id])
	end
	
	def new
		@listing = current_user.listings.new
	end
end
