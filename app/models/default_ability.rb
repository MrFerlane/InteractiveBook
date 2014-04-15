class DefaultAbility < ActiveRecord::Base
  belongs_to :book
  has_many :character_abilities
  has_many :ability_conditions
  has_many :ability_changes
end
