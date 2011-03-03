class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])
    @credits = @player.credits_list
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(params[:player])
    if @player.save
      flash[:notice] = "Successfully created player."
      redirect_to @player
    else
      render :action => 'new'
    end
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])
    if @player.update_attributes(params[:player])
      flash[:notice] = "Successfully updated player."
      redirect_to player_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @player = Player.find(params[:id])
    @player.destroy
    flash[:notice] = "Successfully destroyed player."
    redirect_to players_url
  end
  
  def show_details
    @clear_details = (not params[:clear_details].nil?)
    if (not @clear_details)
      @player = Player.find(params[:id])
      @player_class = params[:player_class_id]
      @credit_entry = @player.credit_entries.find_by_player_class_id(@player_class)
      @events = @player.player_events.find_all_by_player_class_id(@player_class)
      @special_credits = @player.special_credits.find_all_by_player_class_id(@player_class)
      @list = Array.new
      if (not @events.nil?)
        for event_entry in @events
          @list << Hash[
            "event" => event_entry,
            "date" => event_entry.event.event_date,
            "credits" => event_entry.event.credits,
            "note" => event_entry.event.name + " @ " + event_entry.event.location ]
        end
      end
      if (not @special_credits.nil?)
        for special in @special_credits
          @list << Hash[
            "date" => special.date,
            "credits" => special.credits,
            "note" => special.description ]
        end
      end
      @list.sort{|x,y| x["date"] <=> y["date"]}
    end
  end
  
end

class Fixnum
  def to_level
    level = (self/12).floor + 1
    return (level > 6 ? 6 : level)
  end
end
