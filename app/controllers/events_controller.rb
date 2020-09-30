class EventsController < ApplicationController

  def index
    @events = Event.all
   
  end

  def show
    @user = current_user
    @event = Event.find(params[:id])
  end

  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)
    @event.creator_id = current_user.id
    respond_to do |format|
      if @event.save
        format.html { redirect_to current_user, notice: 'event was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event = Event.find(params[:id])
    if @event.present?
      @event.destroy
      redirect_to events_url, notice: 'Event deleted'
    end
  end
  

  private
  def event_params
    params.require(:event).permit(:description)
  end
end
