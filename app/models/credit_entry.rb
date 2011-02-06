class CreditEntry < ActiveRecord::Base
    attr_accessible :player_class_id, :player_id, :total_credits, :initial_credits, :joined_on
    belongs_to :player
    belongs_to :player_class
end
