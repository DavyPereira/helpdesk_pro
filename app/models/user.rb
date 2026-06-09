class User < ApplicationRecord
  
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  has_many :tickets
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy

  enum :role, {
    user: 0,
    admin: 1
  }
  before_create :generate_api_token

  def display_name
    email.split("@").first
         .gsub(/[0-9]/, "")
         .split(/[._\-]/)
         .map(&:capitalize)
         .join(" ")
  end

  private

  def generate_api_token
    self.api_token = SecureRandom.hex(23)
  end
end