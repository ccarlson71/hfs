class SpecialCredit < ActiveRecord::Base
    attr_accessible :player_id, :player_class_id, :credits, :date, :description
end
