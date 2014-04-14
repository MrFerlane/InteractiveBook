class DefaultAttribute < ActiveRecord::Base
  belongs_to :book
  has_many :character_attributes
end
