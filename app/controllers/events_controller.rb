# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :logged_in

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      @event.attendees << @event.creator
      flash[:success] = 'Event created!'
      redirect_to @event
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    @upcoming_events = Event.upcoming_events
    @previous_events = Event.previous_events
    @today_events = Event.today_events
  end
  
  def attend
    Event.find(params[:id]).attendees << current_user
    flash[:success] = 'You are attending this event!'
    redirect_to event_path
  end

  private

  def event_params
    params.require(:event).permit(:title, :date, :description, :location)
  end

  def logged_in
    redirect_to new_user_path if current_user.nil?
  end
end
