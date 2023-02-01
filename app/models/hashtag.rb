class Hashtag < ApplicationRecord
  has_and_belongs_to_many :questions

  validates :name,
            format: { with: /#\w+/ },
            length: { maximum: 280 },
            uniqueness: true
end
