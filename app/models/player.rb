class Player < ActiveRecord::Base
    attr_accessible :name, :dues_paid, :dues_paid_through
    has_many :credit_entries
    has_many :player_events
    has_many :events, :through => :player_events
    has_many :special_credits
    has_many :player_classes, :through => :credit_entries
    
end
