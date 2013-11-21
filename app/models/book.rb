class Book < ActiveRecord::Base
  belongs_to :user
  has_many :characters
  has_many :pages
  has_one :time_control
  validates :name, :presence => {:message => "Назовите книгу"}
  validates :description, :presence => {:message => "Напишите краткое описание к книге"}
end
