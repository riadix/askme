class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User', required: false

  validates :body,
            length: { maximum: 280 },
            presence: true
end
