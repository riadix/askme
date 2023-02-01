class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User', required: false

  has_and_belongs_to_many :hashtags

  validates :body,
            length: { maximum: 280 },
            presence: true
end
