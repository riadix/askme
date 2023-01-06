class User < ApplicationRecord
  has_many :questions, dependent: :destroy

  has_secure_password

  def to_param
    nickname
  end

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
            format: { with: /\A#([[:xdigit:]]{3}){1,2}\z/ },
            allow_nil: true

  include Gravtastic
  gravtastic(secure: true, filetype: :png, size: 100, default: 'retro')

  private

  def downcase_nickname
    nickname.downcase!
  end

  def downcase_email
    email.downcase!
  end
end
