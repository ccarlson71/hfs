class CreditEntry < ActiveRecord::Base
    attr_accessible :player_class_id, :player_id, :total_credits, :initial_credits, :joined_on
end
