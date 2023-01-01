class Question < ApplicationRecord
  belongs_to :user

  validates :body,
            format: { without: /[<>]/ },
            length: { maximum: 280 },
            presence: true
end
