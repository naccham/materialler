class Tag < ApplicationRecord
  has_many :site_tag_relations
  has_many :sites, through: :site_tag_relations
end
