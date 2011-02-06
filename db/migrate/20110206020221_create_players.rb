class CreatePlayers < ActiveRecord::Migration
  def self.up
    create_table :players do |t|
      t.string :name
      t.boolean :dues_paid
      t.date :dues_paid_through
      t.timestamps
    end
  end

  def self.down
    drop_table :players
  end
end
