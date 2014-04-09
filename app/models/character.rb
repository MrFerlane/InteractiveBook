class Character < ActiveRecord::Base
  belongs_to :book
  has_many :character_items
  has_many :character_attributes
  has_many :character_abilities
  validates :name, presence: {message: "Назовите персонажа"}
  validates :description, presence: {message: "Напишите краткое описание персонажа"}
end
