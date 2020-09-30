class EventsController < ApplicationController
  #before_action :find_user
  def index
    @events = Event.all
   
  end

  def show
    @events = current_user.events.find(params[:id])

    
  end

  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)
    respond_to do |format|
      if @event.save
        format.html { redirect_to current_user, notice: 'event was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def find_user
    @user = User.find(:current_user)
   
  end

  private
    
    def event_params
      params.require(:event).permit(:description)
    end
end
