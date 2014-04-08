class Character < ActiveRecord::Base
  belongs_to :book
  has_many :items
  has_many :abilities
  has_many :attributes
  validates :name, presence: {message: "Назовите персонажа"}
  validates :description, presence: {message: "Напишите краткое описание персонажа"}
end
