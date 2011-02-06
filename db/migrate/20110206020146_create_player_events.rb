class CreatePlayerEvents < ActiveRecord::Migration
  def self.up
    create_table :player_events do |t|
      t.integer :player_id
      t.integer :event_id
      t.integer :player_class_id
      t.timestamps
    end
  end

  def self.down
    drop_table :player_events
  end
end
