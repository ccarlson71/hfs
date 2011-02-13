# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

PlayerClass.delete_all
player_classes = PlayerClass.create([
  { :name => 'Archer' },
  { :name => 'Assassin' },
  { :name => 'Barbarian' },
  { :name => 'Bard' },
  { :name => 'Druid' },
  { :name => 'Healer' },
  { :name => 'Monk' },
  { :name => 'Paladin' },
  { :name => 'Scout' },
  { :name => 'Warrior' },
  { :name => 'Wizard' },
  { :name => 'Infernal Champion' },
  { :name => 'Samurai' }
  ])
  
Player.delete_all
CreditEntry.delete_all

open("db/seed_data/player_list.txt") do |players|
  players.read.each_line do |player|
    next if player[0..0] == "#"
    player_name,class_list = player.chomp.split("|")
    puts "New player: #{player_name}"
    new_player = Player.create!(:name => player_name, :dues_paid => false, :dues_paid_through => nil)
    if class_list != nil
      class_list.split(",").each do |class_entry|
        class_name,credits = class_entry.split(":")
        puts "  -- #{class_name}: #{credits}"
        new_credit_entry = CreditEntry.create!(
          :player_class_id => PlayerClass.find_by_name(class_name).id,
          :total_credits => credits,
          :initial_credits => credits)
        new_player.credit_entries << new_credit_entry
      end
    end
  end
end