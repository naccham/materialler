class Comment < ApplicationRecord
  belongs_to :site
  belongs_to :user
  
  validates :comment, presence: true
end
