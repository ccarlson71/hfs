class Event < ActiveRecord::Base
    attr_accessible :event_date, :name, :credits, :location
    has_many :player_events
    has_many :players, :through => :player_events
end
