class Article < ApplicationRecord
  validates :title, presence: true, length: {minimum: 4,maximun: 14}
  validates :description , presence: true, length: {minimum: 4,maximun: 14}
end