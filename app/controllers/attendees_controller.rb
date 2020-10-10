class AttendeesController < ApplicationController
    

    def create
        @event = Event.find(params[:event_id])
        @attendee = @event.attendees.create(params[:attendee].permit(:email))
        @attendees = Attendee.all.where(email:"dave@gmail.com")
        redirect_to event_path(@event)
    end  
end
