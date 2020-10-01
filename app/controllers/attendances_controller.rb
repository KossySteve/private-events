class AttendancesController < ApplicationController
  before_action :find_event
  def new
    @attendance = @event.attendances.new
  end

  def create
    @attendance = @event.attendances.create(params[:attendance].permit(:present))
    respond_to do |format|
      if present == true
        format.html { redirect_to event_attendance_path, notice: 'You attended this event' }
      else
        format.html { redirect_to event_attendance_path, notice: 'You didn\'t attend this event' }
      end
    end
  end

  def find_event
    @event = Event.find(params[:event_id])
  end
end
