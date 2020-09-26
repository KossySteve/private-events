class EventsController < ApplicationController
  def show
    #@events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
  end
end
