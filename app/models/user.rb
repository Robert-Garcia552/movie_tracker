class User < ApplicationRecord
  has_secure_password

  has_many :watched_movies, dependent: :destroy
  
  before_save :downcase_email, :capitalize_name

  validates :first_name, :last_name, :email, :presence => true, on: :create
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :email, uniqueness: true
  validates :password, length: { minimum: 8 }, on: :create

  private 

  def downcase_email
    self.email = email.downcase
  end

  def capitalize_name
    self.first_name = first_name.capitalize
    self.last_name = last_name.capitalize
  end
end
