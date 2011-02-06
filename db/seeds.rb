# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

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
  
players = Player.create([
  { :name => 'Chris Carlson', :dues_paid => true, :dues_paid_through => Date.civil(2037,12,31) }
  ])