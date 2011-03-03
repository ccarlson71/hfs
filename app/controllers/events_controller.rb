class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @attendees = @event.player_events
  end

  def new
    @event = Event.new
    @player_classes = PlayerClass.order('name ASC').collect {|p| [p.name, p.id]}
  end

  def create
    @event = Event.new(params[:event])
    if @event.save
      flash[:notice] = "Successfully created event."
      redirect_to @event
    else
      render :action => 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
    @users = Player.order("name")
    @player_classes = PlayerClass.order('name ASC').collect {|p| [p.name, p.id]}
    @class_played = Hash.new(Hash["player_class_id"=>nil])
    for player in @event.player_events
      @class_played[player.player_id] = Hash["player_class_id" => player.player_class_id]
    end
  end

  def update
    classes_played = Hash.new
    raw_classes_played = params[:class_played].delete_if{|key,value| value["player_class_id"] == ""}
    logger.debug("#{raw_classes_played.size} actual players submitted")
    @event = Event.find(params[:id])
    @event.player_events.destroy_all
    for player in raw_classes_played.keys
      player_class = raw_classes_played[player]["player_class_id"]
      if (not player_class.nil?)
        Player.find(player.to_i).setup_credit_entry_for(player_class.to_i)
        @event.player_events << PlayerEvent.new(:player_id => player.to_i, :player_class_id => player_class.to_i) if player_class != ""
      end
    end
    
    if @event.update_attributes(params[:event])
      flash[:notice] = "Successfully updated event."
      redirect_to event_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:notice] = "Successfully destroyed event."
    redirect_to events_url
  end
end
