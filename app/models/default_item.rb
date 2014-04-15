class DefaultItem < ActiveRecord::Base
  belongs_to :book
  has_many :character_items
  has_many :item_conditions
  has_many :item_changes
end
