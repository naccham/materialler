class Site < ApplicationRecord
  has_many :site_tag_relations, dependent: :destroy
  has_many :tags, through: :site_tag_relations

  has_many :bookmarks, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  validates :title, presence: true
  validates :introduce, presence: true
  validates :url, presence: true
  validates :commercial_use?, inclusion: {in: [true, false]}
  validates :credit_notation?, inclusion: {in: [true, false]}

  def bookmarked_by?(user)
    bookmarks.where(user_id: user.id).exists?
  end
  
  def self.search(search)
    if search != ""
      Site.where(['title LIKE(?) OR introduce LIKE(?)', "%#{search}%", "%#{search}%"])
    else
      Site.all
    end
  end
  
end
