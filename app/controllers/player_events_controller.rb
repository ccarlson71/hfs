class PlayerEventsController < ApplicationController
  def index
    @player_events = PlayerEvent.all
  end

  def show
    @player_event = PlayerEvent.find(params[:id])
  end

  def new
    @player_event = PlayerEvent.new
  end

  def create
    @player_event = PlayerEvent.new(params[:player_event])
    if @player_event.save
      flash[:notice] = "Successfully created player event."
      redirect_to @player_event
    else
      render :action => 'new'
    end
  end

  def edit
    @player_event = PlayerEvent.find(params[:id])
  end

  def update
    @player_event = PlayerEvent.find(params[:id])
    if @player_event.update_attributes(params[:player_event])
      flash[:notice] = "Successfully updated player event."
      redirect_to player_event_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @player_event = PlayerEvent.find(params[:id])
    @player_event.destroy
    flash[:notice] = "Successfully destroyed player event."
    redirect_to player_events_url
  end
end
