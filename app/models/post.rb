class Post < ApplicationRecord
  validates :title, :content, :date, presence: true
end
