class EventsController < ApplicationController
  before_action :find_user
  def index
    #@events = Event.all
    @events = @user.events.all

  end

  def show
    #@events = Event.all
  end

  def new
   
    @event = @user.events.build
  
  end

  def create
    @event = @user.events.build(event_params)
    respond_to do |format|
      if @event.save
        format.html { redirect_to @user, notice: 'event was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def find_user
    @user = User.find(params[:user_id])
  end

 

  private
    
    def event_params
      params.require(:event).permit(:description)
    end
end
