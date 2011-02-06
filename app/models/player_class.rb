class PlayerClass < ActiveRecord::Base
    attr_accessible :name
    has_many :credit_entries
    has_many :player_events
    has_many :players, :through => :credit_entries
    has_many :special_credits

    
end
