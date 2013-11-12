class Character < ActiveRecord::Base
  belongs_to :book
  has_many :items
end
