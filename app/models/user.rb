class User < ApplicationRecord
  has_many :questions, dependent: :delete_all

  has_secure_password

  before_validation :downcase_nickname, :downcase_email

  validates :nickname,
            format: { with: /\A[a-z_]+\z/ },
            length: { maximum: 40 },
            uniqueness: true

  validates :email,
            format: { with: /\A[a-zA-Z0-9_.-]+@[a-zA-Z0-9]+\.[a-zA-Z]+\z/ },
            presence: true,
            uniqueness: true

  validates :navbar_color,
            format: { with: /\A#[a-fA-F0-9]{6}\z/ }

  private

  def downcase_nickname
    nickname.downcase!
  end

  def downcase_email
    email.downcase!
  end
end
