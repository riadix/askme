class User < ApplicationRecord
  has_secure_password

  before_save :downcase_nickname

  validates :nickname,
            format: { with: /\A[a-z_]+\z/ },
            length: { maximum: 40 },
            uniqueness: true

  validates :email,
            format: { with: /\A[a-zA-Z0-9_.-]+@[a-zA-Z0-9]+.[a-zA-Z]+\z/ },
            presence: true,
            uniqueness: true

  def downcase_nickname
    nickname.downcase!
  end
end
