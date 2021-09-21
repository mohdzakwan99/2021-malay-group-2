class User < ApplicationRecord
  validates :name, presence: true
  validates :email, uniqueness: true
  before_save :downcase_email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
  has_secure_password

  private

  def downcase_email
    self.email.downcase!
  end
end
