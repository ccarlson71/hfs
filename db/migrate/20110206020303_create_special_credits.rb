class CreateSpecialCredits < ActiveRecord::Migration
  def self.up
    create_table :special_credits do |t|
      t.integer :player_id
      t.integer :player_class_id
      t.integer :credits
      t.date :date
      t.string :description
      t.timestamps
    end
  end

  def self.down
    drop_table :special_credits
  end
end
