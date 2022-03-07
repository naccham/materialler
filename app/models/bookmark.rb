class Bookmark < ApplicationRecord
  belongs_to :site
  belongs_to :user

  def bookmarked_by?(user)
    bookmarks.where(user_id: user.id).exists?
  end
end
