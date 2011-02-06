class PlayerEvent < ActiveRecord::Base
    attr_accessible :player_id, :event_id, :player_class_id
end
