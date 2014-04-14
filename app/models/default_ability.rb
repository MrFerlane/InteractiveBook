class DefaultAbility < ActiveRecord::Base
  belongs_to :book
  has_many :character_abilities
end
