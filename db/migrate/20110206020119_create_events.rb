class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.date :event_date
      t.string :name
      t.integer :credits
      t.string :location
      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
