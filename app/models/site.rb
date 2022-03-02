class Site < ApplicationRecord
  has_many :site_tag_relations, dependent: :destroy
  has_many :tags, through: :site_tag_relations

  has_many :bookmarks, dependent: :destroy
end
