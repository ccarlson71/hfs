class PlayerEvent < ActiveRecord::Base
    attr_accessible :player_id, :event_id, :player_class_id
    belongs_to :player
    belongs_to :event
    belongs_to :player_class
end
