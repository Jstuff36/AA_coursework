class User < ApplicationRecord
  validates :username, :password_digest, presence: true
  validates :password, length: {minimum: 6, allow_nil: true }

  def password=(password)
    @password = password
    self.password_digest
  end
end
