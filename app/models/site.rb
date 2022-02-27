class Site < ApplicationRecord
  belongs_to :tag
  has_many :bookmarks, dependent: :destroy
end
