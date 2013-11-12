class User < ActiveRecord::Base
  has_secure_password
  has_many :books
  validates :name, :presence => {:message => "User must have a name"},
            :uniqueness => {:message => "User with this name is already exist"}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
      format:     { with: VALID_EMAIL_REGEX },
      uniqueness: { case_sensitive: false }
  validates :password, presence: {on: :create}, length: { minimum: 8, allow_blank: true }
  validates :password_confirmation, presence: {on: :create}
end
