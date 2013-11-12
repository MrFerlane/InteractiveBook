class Act < ActiveRecord::Base
  belongs_to :page
  has_many :conditions
  has_many :changes
end
