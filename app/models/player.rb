class Player < ActiveRecord::Base
    attr_accessible :name, :dues_paid, :dues_paid_through
end
