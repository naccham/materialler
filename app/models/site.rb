class Site < ApplicationRecord
  has_many :site_tag_relations, dependent: :destroy
  has_many :tags, through: :site_tag_relations

  has_many :bookmarks, dependent: :destroy
  has_many :comments, dependent: :destroy

  def bookmarked_by?(user)
    bookmarks.where(user_id: user.id).exists?
  end
end
