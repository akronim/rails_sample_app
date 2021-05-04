class User < ApplicationRecord
  attr_accessor :remember_token
  # downcase the email attribute before saving the user
  # before_save { self.email = email.downcase } # where self = the current user
  # using the “bang” method
  before_save { email.downcase! }
  # validates :name, presence: true
  # validates :name, { presence: true }
  # validates(:name, presence: true)
  validates(:name, { presence: true, length: { maximum: 50 } })
  # constants start with a capital letter
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }, allow_blank: true

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
      BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Create a random string of digits for use as a remember token.
  # (As a general rule, if a method doesn’t need an instance of an object,
  #   it should be a class method)
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end
end

# Remeber Me
# 1. Create a random string of digits for use as a remember token.
# 2. Place the token in the browser cookies with an expiration date far in the
# future.
# 3. Save the hash digest of the token to the database.
# 4. Place an encrypted version of the user’s id in the browser cookies.
# 5. When presented with a cookie containing a persistent user id, find the
# user in the database using the given id, and verify that the remember
# token cookie matches the associated hash digest from the database.
