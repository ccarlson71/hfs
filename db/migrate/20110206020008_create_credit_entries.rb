class CreateCreditEntries < ActiveRecord::Migration
  def self.up
    create_table :credit_entries do |t|
      t.integer :player_class_id
      t.integer :player_id
      t.integer :total_credits
      t.integer :initial_credits
      t.date :joined_on
      t.timestamps
    end
  end

  def self.down
    drop_table :credit_entries
  end
end
