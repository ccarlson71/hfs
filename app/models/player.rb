class Player < ActiveRecord::Base
    attr_accessible :name, :dues_paid, :dues_paid_through, :lifetime_member
    has_many :credit_entries
    has_many :player_events, :include => :player_class
    has_many :events, :through => :player_events
    has_many :special_credits
    has_many :player_classes, :through => :credit_entries, :uniq => :true
    
    def setup_credit_entry_for(player_class)
      if (not self.has_credits_in?(player_class))
        new_entry = CreditEntry.create(
          :player_class_id => player_class,
          :total_credits => 0,
          :initial_credits => 0)
        self.credit_entries << new_entry
      end
    end
    
    def has_credits_in?(player_class)
      return (self.credit_entries.select{|ce| ce.player_class_id == player_class}.size > 0)
    end
    
    def credits_for(player_class)
      return 0 if (not self.has_credits_in?(player_class))
      credits = self.credit_entries.select{|ce| ce.player_class_id == player_class}[0].initial_credits
      for entry in self.player_events.select{|pe| pe.player_class_id == player_class}
        credits += entry.event.credits
      end
      for entry in self.special_credits.select{|sc| sc.player_class_id == player.class}
        credits += entry.credits
      end
      return credits
    end

    def credits_list
      results = Hash.new
      self.player_classes.each {|c| results[c.id] = self.credits_for(c.id)}
      return results
    end
end
