class User < ApplicationRecord
  has_secure_password
  has_many :job_applications, dependent: :destroy
  has_many :application_events, dependent: :destroy

  before_save :downcase_email

  validates :email,
            presence:   true,
            uniqueness: { case_sensitive: false },
            format:     { with: URI::MailTo::EMAIL_REGEXP, message: "is not a valid email" }

  validates :password,
            presence: true,
            length:   { minimum: 8 },
            if:       :password_digest_changed?

  validates :weekly_goal, numericality: { greater_than: 0, less_than_or_equal_to: 20 }, allow_nil: true

  private

  def downcase_email
    self.email = email.downcase
  end

end