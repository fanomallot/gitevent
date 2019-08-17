class EventsController < ApplicationController
	def index 
		@event = Event.all	
	end
	def show
		@event = Event.find(params[:id])
		@end_date = @event.start_date.to_time + @event.duration * 60
	end
	def new
		@e = Event.new
	end
	def create
		start_date = "#{params[:date]} #{params[:time]}"
		d = params[:timer].to_time.min + params[:timer].to_time.hour.minute
		if  user_signed_in?
			@e = Event.new(start_date: start_date ,
    		title: params[:title],
    		description: params[:description],
    		price: params[:price],
    		location: params[:location],
    		admin: current_user,
    		participants: [current_user])
    		@e.duration = d
			if @e.save
				flash.now[:success] = "success update"
				redirect_to event_path(@e.id)
			else
			 	flash.now[:message] = "Le durée doits être positif et multiple de 5"
				flash.now[:danger] = "Update error"
				render 'new'
			end
		else 
			redirect_to new_user_session_path
		end
	end
	def destroy
		@event = Event.find(params[:id])
		@event.attendances.each do |attendance|
			attendance.destroy
		end	
		@event.destroy
		flash[:danger] = "event destroy"
		redirect_to user_path(@event.admin.id)
	end
end
