class LikesController < ApplicationController
	before_action :require_signin

	def create
		set_event
		@event.likes.create!(user: current_user)
		redirect_to @event, notice: "Glad you liked it!"
	end

	def destroy
		like = current_user.likes.find(params[:id])
		like.destroy
		
		set_event
		redirect_to @event, notice: "Sorry!"
	end

private
	def set_event
		@event = Event.find(params[:event_id])
	end
end
