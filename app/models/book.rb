class Book < ActiveRecord::Base
  belongs_to :user
  has_many :characters
  has_many :pages
  has_one :time_control
  validates :name, :presence => {:message => "Book must have a name"},
            :uniqueness => {:message => "Book with this name is already exist"}
  validates :description, :presence => {:message => "Book must have a description"}
end
