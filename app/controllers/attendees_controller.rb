class AttendeesController < ApplicationController
    

    def create
        @event = Event.find(params[:event_id])
        @attendee = @event.attendees.create(params[:attendee].permit(:email))
        redirect_to event_path(@event)
    end  
end
