class AttendancesController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    @attendance = @event.attendances.create(params[:attendance].permit(:name))
    redirect_to event_path(@event)
  end
end
