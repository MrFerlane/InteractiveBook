class DefaultItem < ActiveRecord::Base
  belongs_to :book
  has_many :character_items
end
