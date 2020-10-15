class EventsController < ApplicationController
    def index
        @events = Event.all
        @upcoming_events = @events.where('date >= ?', Date.today)
        @prev_events = @events.where('date < ?', Date.today)
      end
    
    
      def show
        @event = Event.find(params[:id])
        @user = User.find(@event.user_id)
      end
    
      def new
        @event = current_user.events.build
      end
    
     
    
      def create
        @user = current_user
        @event = @user.events.build(event_params)
        respond_to do |format|
          if @event.save
            @user.events << @event
            format.html { redirect_to current_user, notice: 'event was successfully created.' }
          else
            format.html { render :new }
            format.json { render json: @event.errors, status: :unprocessable_entity }
          end
        end
      end
    
      private
    
      def event_params
        params.require(:event).permit(:description, :date)
      end
end
