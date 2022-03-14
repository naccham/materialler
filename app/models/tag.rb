class Tag < ApplicationRecord
  has_many :site_tag_relations, dependent: :destroy
  has_many :sites, through: :site_tag_relations

  validates :name, presence: true
end
