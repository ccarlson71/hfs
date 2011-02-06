class Event < ActiveRecord::Base
    attr_accessible :event_date, :name, :credits, :location
end
