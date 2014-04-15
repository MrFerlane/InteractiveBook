class DefaultAttribute < ActiveRecord::Base
  belongs_to :book
  has_many :character_attributes
  has_many :attribute_conditions
  has_many :attribute_changes
end
