class Book < ActiveRecord::Base
  before_save :default_values
  belongs_to :user
  has_many :characters
  has_many :pages
  has_many :default_abilities
  has_many :default_attributes
  has_many :default_items
  has_one :time_control
  validates :name, :presence => {:message => "Назовите книгу"}
  validates :description, :presence => {:message => "Напишите краткое описание к книге"}

  def default_values
    self.status ||= 'draft'
  end
end
