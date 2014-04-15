class Act < ActiveRecord::Base
  belongs_to :page
  has_many :item_conditions
  has_many :attribute_conditions
  has_many :ability_conditions
  has_many :ability_changes
  has_many :attribute_changes
  has_many :item_changes
  has_many :changes
end
