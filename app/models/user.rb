class User < ApplicationRecord
  attr_accessor :remember_token
  before_save { email.downcase! }
  mount_uploader :picture, ProfilePictureUploader
  validates :firstname, presence: true, length: { maximum: 25 }
  validates :lastname, presence: true, length: { maximum: 25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  has_secure_password
  VALID_PW_REGEX = /\A(?=.*[a-zA-Z])(?=.*[0-9]).{8,}\z/
  validates :password, presence: true,
            Format: { with: VALID_PW_REGEX },
            allow_nil: true

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
end
