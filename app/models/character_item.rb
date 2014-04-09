class CharacterItem < ActiveRecord::Base
  belongs_to :default_item
  belongs_to :character
  validates :default_item_id, uniqueness: {message: "Такой предмет уже существует у персонажа"}
end
